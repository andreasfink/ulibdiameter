//
//  UMDiameterPeer.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPeer.h"
#import "UMDiameterPacket.h"
#import "UMDiameterPeerState_all.h"
#import "UMDiameterTcpConnection.h"
#import "UMDiameterApplicationId.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterResultCode.h"
#import "UMDiameterPacketCEA.h"
#import "UMDiameterPacketCER.h"
#import "UMDiameterPacketDWR.h"
#import "UMDiameterPacketDWA.h"

#import "UMDiameterAvpAll.h"

@implementation UMDiameterPeer

- (UMDiameterPeer *)init
{
    self = [super init];
    if(self)
    {
        _peerState = [[UMDiameterPeerState_Closed alloc]init];
        _isConnected = NO;
        _isActive = NO;
        _isConnecting = NO;
        _nextHopIdentifierLock = [[UMMutex alloc]init];
    }
    return self;
}

- (void) sctpStatusIndication:(UMLayer *)caller
                       userId:(id)uid
                       status:(SCTP_Status)statusNew
{
    UMLayerSctp *sctp = NULL;
    SCTP_Status previousStatus;
    BOOL initiator;

    if([caller isEqualTo:_sctp_i])
    {
        sctp = _sctp_i;
        previousStatus = _sctpStatus_i;
        initiator = YES;
    }
    else if([caller isEqualTo:_sctp_r])
    {
        sctp = _sctp_r;
        previousStatus = _sctpStatus_r;
        initiator = NO;
    }
    else
    {
        NSLog(@"sctp status update for a connection we dont know");
        return;
    }
    if(previousStatus == statusNew)
    {
        return;
    }
    NSString *oldStatusString= @"undefined";
    switch(previousStatus)
    {
        case  SCTP_STATUS_M_FOOS:
            oldStatusString = @"M_FOOS";
            break;
        case SCTP_STATUS_OFF:
            oldStatusString = @"OFF";
            break;
        case SCTP_STATUS_OOS:
            oldStatusString = @"OOS";
            break;
        case SCTP_STATUS_IS:
            oldStatusString = @"IS";
            break;
    }
    if(initiator)
    {
        _sctpStatus_i = statusNew;
    }
    else
    {
        _sctpStatus_r = statusNew;
    }
    switch(statusNew)
    {
        case  SCTP_STATUS_M_FOOS:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->M_FOOS",oldStatusString];
            [self.logFeed infoText:s];
            if(initiator)
            {
                _peerState = [_peerState eventI_Rcv_Conn_Nack:self message:NULL];
            }
            else
            {
                _peerState = [_peerState eventR_Rcv_Conn_Nack:self message:NULL];
            }
            break;
        }
        case SCTP_STATUS_OFF:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->OFF",oldStatusString];
            [self.logFeed infoText:s];
            if(initiator)
            {
                _peerState = [_peerState eventI_Rcv_Conn_Ack:self message:NULL];
            }
            else
            {
                _peerState = [_peerState eventR_Rcv_Conn_Ack:self message:NULL];
            }
            break;
        }
        case SCTP_STATUS_OOS:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->OOS",oldStatusString];
            [self.logFeed infoText:s];
            break;
        }
        case SCTP_STATUS_IS:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->IS",oldStatusString];
            [self.logFeed infoText:s];
            if(initiator)
            {
                _peerState = [_peerState eventI_Rcv_Conn_Ack:self message:NULL];
            }
            else
            {
                _peerState = [_peerState eventR_Rcv_Conn_Ack:self message:NULL];
            }
            break;
        }
    }
}

- (void) sctpDataIndication:(UMLayer *)caller
                     userId:(id)uid
                   streamId:(uint16_t)sid
                 protocolId:(uint32_t)pid
                       data:(NSData *)d
{
    UMLayerSctp *sctp = NULL;
    BOOL initiator;

    if([caller isEqualTo:_sctp_i])
    {
        sctp = _sctp_i;
        initiator = YES;
    }
    else if([caller isEqualTo:_sctp_r])
    {
        sctp = _sctp_r;
        initiator = NO;
    }
    else
    {
        NSLog(@"sctp status update for a connection we dont know");
        return;
    }

    UMDiameterPacket *packet = [[UMDiameterPacket alloc]initWithData:d];
    if(!packet)
    {
        NSString *s = [NSString stringWithFormat:@"can not decode SCTP packet\n\tstream:%d\n\tprotocol:%d\n\tpacket: %@",(int)sid, (int)pid, [d hexString]];
        NSLog(@"%@",s);
        [self.logFeed majorError:0 withText:s];
        /* FIXME: what shall we do in case of packets we can not decode? */
        //_peerState = [_peerState eventError:self message:d];
    }
    if((pid!=0) && (pid!=DIAMETER_SCTP_PPID_CLEAR))
    {
        NSString *s = [NSString stringWithFormat:@"Unsupported protocol ID for Diameter. PID=%d", (int)pid];
        NSLog(@"%@",s);
        [self.logFeed majorError:0 withText:s];
        /* FIXME: what shall we do in case of packets we can not decode? */
        // _peerState = [_peerState eventStop:self];
    }

    if(packet.commandFlags & UMDiameterCommandFlag_Request)
    {
        if((packet.applicationId == UMDiameterApplicationId_Diameter_Common_Messages)
            && (packet.commandCode == UMDiameterCommandCode_Capabilities_Exchange))
        {
            [self processCER:packet];
        }
        if((packet.applicationId == UMDiameterApplicationId_Diameter_Common_Messages)
           && (packet.commandCode == UMDiameterCommandCode_Device_Watchdog))
        {
            [self processDWR:packet];
        }
    }
    else if(!(packet.commandFlags & UMDiameterCommandFlag_Request))
    {
        switch(packet.applicationId)
        {
            case UMDiameterApplicationId_Diameter_Common_Messages:
            {
                switch(packet.commandCode)
                {
                    case UMDiameterCommandCode_Capabilities_Exchange:
                    {
                        if(packet.flagRequest)
                        {
                            if(initiator)
                            {
                                _peerState = [_peerState eventI_Rcv_CER:self message:packet];
                            }
                            else
                            {
                                _peerState = [_peerState eventR_Rcv_CER:self message:packet];
                            }
                        }
                        else
                        {
                            if(initiator)
                            {
                                _peerState = [_peerState eventI_Rcv_CEA:self message:packet];
                            }
                            else
                            {
                                _peerState = [_peerState eventR_Rcv_CEA:self message:packet];
                            }
                        }
                        break;
                    }
                    case UMDiameterCommandCode_Disconnect_Peer:
                    {
                        if(packet.flagRequest)
                        {
                            if(initiator)
                            {
                                _peerState = [_peerState eventI_Rcv_DPR:self message:packet];
                            }
                            else
                            {
                                _peerState = [_peerState eventR_Rcv_DPR:self message:packet];
                            }
                        }
                        else
                        {
                            if(initiator)
                            {
                                _peerState = [_peerState eventI_Rcv_DPA:self message:packet];
                            }
                            else
                            {
                                _peerState = [_peerState eventR_Rcv_DPA:self message:packet];
                            }
                        }
                        break;
                    }
                    case UMDiameterCommandCode_Device_Watchdog:
                    {
                        if(packet.flagRequest)
                        {
                            if(initiator)
                            {
                                _peerState = [_peerState eventI_Rcv_DWA:self message:packet];
                            }
                            else
                            {
                                _peerState = [_peerState eventR_Rcv_DWA:self message:packet];
                            }
                        }
                        else
                        {
                            if(initiator)
                            {
                                _peerState = [_peerState eventI_Rcv_DWA:self message:packet];
                            }
                            else
                            {
                                _peerState = [_peerState eventR_Rcv_DWA:self message:packet];
                            }
                        }
                        break;
                    }
                        /* FIXME: this shoudl be moved into eventProcessPacket... */
                    case UMDiameterCommandCode_Abort_Session:
                        [self processASR:packet];
                        break;
                    case UMDiameterCommandCode_Accounting:
                        [self processACR:packet];
                        break;

                    case UMDiameterCommandCode_Re_Auth:
                        [self processRAR:packet];

                    case UMDiameterCommandCode_Session_Termination:
                        [self processSTR:packet];
                        break;
                }
                break;
            }
            case UMDiameterApplicationId_Diameter_Base_Accounting:
            case UMDiameterApplicationId_3GPP_S6a_S6d:
            case UMDiameterApplicationId_3GPP_S9:
            case UMDiameterApplicationId_3GPP_SLh:
            default:
                [_router processIncomingPacket:packet fromPeer:self];
                break;
        }
    }
}

- (void) sctpMonitorIndication:(UMLayer *)caller
                        userId:(id)uid
                      streamId:(uint16_t)sid
                    protocolId:(uint32_t)pid
                          data:(NSData *)d
                      incoming:(BOOL)in
{
}

- (void) adminAttachConfirm:(UMLayer *)attachedLayer
                     userId:(id)uid
{
}

- (void) adminAttachFail:(UMLayer *)attachedLayer
                  userId:(id)uid
                  reason:(NSString *)reason
{
}

- (void) adminDetachConfirm:(UMLayer *)attachedLayer
                     userId:(id)uid
{
}

- (void) adminDetachFail:(UMLayer *)attachedLayer
                  userId:(id)uid
                  reason:(NSString *)reason
{
}

- (void)sentAckConfirmFrom:(UMLayer *)sender
                  userInfo:(NSDictionary *)userInfo
{
}

- (void)sentAckFailureFrom:(UMLayer *)sender
                  userInfo:(NSDictionary *)userInfo
                     error:(NSString *)err
                    reason:(NSString *)reason
                 errorInfo:(NSDictionary *)ei
{
}



- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMDiameterPeerAppDelegateProtocol>)appContext
{

    [self readLayerConfig:cfg];

    if(cfg[@"name"])
    {
        self.layerName = [cfg[@"name"] stringValue];
    }
    if(cfg[@"attach-to"])
    {
        NSString *attachTo =  [cfg[@"attach-to"] stringValue];
        _sctp = [appContext getSCTP:attachTo];
        if(_sctp == NULL)
        {
            NSString *s = [NSString stringWithFormat:@"Can not find sctp layer '%@' referred from m2pa layer '%@'",attachTo,self.layerName];
            @throw([NSException exceptionWithName:[NSString stringWithFormat:@"CONFIG_ERROR FILE %s line:%ld",__FILE__,(long)__LINE__]
                                           reason:s
                                         userInfo:NULL]);
        }
    }
    [self adminAttachOrder];
}


- (void)adminAttachOrder
{
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"adminAttachOrder"];
    }

    UMLayerSctpUserProfile *profile = [[UMLayerSctpUserProfile alloc]initWithDefaultProfile];
    [_sctp adminAttachFor:self profile:profile userId:self.layerName];
}

- (void)stopDetachAndDestroy
{
}

- (void)powerOn
{
    [_sctp openFor:self];
}

- (void)powerOff
{
    [_sctp closeFor:self];
}

- (uint32_t)nextHopByHopIdentifier

{
    uint32_t r;
    [_nextHopIdentifierLock lock];
    r = ++_lastHopByHopIdentifier;
    [_nextHopIdentifierLock unlock];
    return r;
}


- (void)sendPacket:(UMDiameterPacket *)packet
{
    [packet beforeEncode];
    NSData *packedData = [packet packedData];

    [_sctp dataFor:self
              data:packedData
          streamId:0
        protocolId:DIAMETER_SCTP_PPID_CLEAR
        ackRequest:NULL];
}


- (void)sendCER
{
    UMDiameterPacket *p = [self createCER];
    [self sendPacket:p];
}

- (UMDiameterPacket *)createCER
{
    UMDiameterPacketCER *packet = [[UMDiameterPacketCER alloc]init];
    packet.version = 1;
    packet.commandFlags = UMDiameterCommandFlag_Request;
    packet.commandCode = UMDiameterCommandCode_Capabilities_Exchange;
    packet.applicationId = UMDiameterApplicationId_Diameter_Common_Messages;
    packet.hopByHopIdentifier = [self nextHopByHopIdentifier];
    packet.endToEndIdentifier = [_router nextEndToEndIdentifier];

    /*
     * [ Auth-Application-Id ]
     * [ Inband-Security-Id ]
     * [ Acct-Application-Id ]
     * [ Vendor-Specific-Application-Id ]
     [ Firmware-Revision ]
     * [ AVP ]
     */


    //      { Origin-Host }
    if(_router.localHostName.length > 0)
    {
        packet.var_origin_host = [[UMDiameterAvpOrigin_Host alloc]initWithString:_router.localHostName];
    }
    //      { Origin-Realm }
    if(_router.localRealm.length > 0)
    {
        packet.var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]initWithString:_router.localRealm];
    }

    //     1* { Host-IP-Address }
    NSArray *addrs = _sctp.configured_local_addresses;
    NSMutableArray<UMDiameterAvpHost_IP_Address *> *hosts = [[NSMutableArray alloc]init];
    for (NSString *addr in addrs)
    {
        UMDiameterAvpHost_IP_Address *avp =  [[UMDiameterAvpHost_IP_Address alloc]initWithString:addr];
        [hosts addObject:avp];
    }
    packet.var_host_ip_address = hosts;


    //      { Vendor-Id }
    if(_router.vendorId)
    {
        packet.var_vendor_id = [[UMDiameterAvpVendor_Id alloc]initWithObject:@(_router.vendorId)];
    }

    //     { Product-Name }
    if(_router.productName.length>0)
    {
        packet.var_product_name = [[UMDiameterAvpProduct_Name alloc]initWithString:_router.productName];
    }

    //      [ Origin-State-Id ]
    if(_originStateId!=NULL)
    {
        packet.var_origin_state_id =  [[UMDiameterAvpOrigin_State_Id alloc]initWithObject:_originStateId];
    }

    //      * [ Supported-Vendor-Id ]
    if([_router.supportedVendorIds count] > 0)
    {
        NSMutableArray<UMDiameterAvpSupported_Vendor_Id *>*arr =  [[NSMutableArray alloc]init];
        for(NSNumber *n in _router.supportedVendorIds)
        {
            UMDiameterAvpSupported_Vendor_Id *avp =  [[UMDiameterAvpSupported_Vendor_Id alloc]initWithObject:n];
            [arr addObject:avp];
        }
        packet.var_supported_vendor_id = arr;
    }

    //      * [ Auth-Application-Id ]
    if([_router.authApplicationIds count] > 0)
    {
        NSMutableArray<UMDiameterAvpAuth_Application_Id *> *arr = [[NSMutableArray alloc]init];
        for(NSNumber *n in _router.authApplicationIds)
        {
            UMDiameterAvpAuth_Application_Id *avp =  [[UMDiameterAvpAuth_Application_Id alloc]initWithObject:n];
            [arr addObject:avp];
        }
        packet.var_auth_application_id = arr;
    }

    //         [ Inband-Security-Id ]
    if([_router.inbandSecurityIds count] > 0)
    {
        NSMutableArray<UMDiameterAvpInband_Security_Id *>*arr =   [[NSMutableArray alloc]init];
        for(NSNumber *n in _router.inbandSecurityIds)
        {
            UMDiameterAvpInband_Security_Id *avp =  [[UMDiameterAvpInband_Security_Id alloc]initWithObject:n];
            [arr addObject:avp];
        }
        packet.var_inband_security_id = arr;
    }

    //      * [ Acct-Application-Id ]

    NSArray<NSNumber *> *auths = [_router.authApplicationIds copy];
    if(auths.count>0)
    {
        NSMutableArray<UMDiameterAvpAcct_Application_Id *> *entries = [[NSMutableArray alloc]init];
        for(NSNumber *auth_id in auths)
        {
            UMDiameterAvpAcct_Application_Id *aid = [[UMDiameterAvpAcct_Application_Id alloc]initWithObject:auth_id];
            [entries addObject:aid];
        }
        packet.var_acct_application_id = entries;
    }

    //      * [ Vendor-Specific-Application-Id ]
    NSArray<NSDictionary *>*vids = [_router.vendorSpecificIds copy];
    if(vids.count>0)
    {
        NSMutableArray<UMDiameterAvpVendor_Specific_Application_Id *> *entries = [[NSMutableArray alloc]init];
        for(NSDictionary *vid in vids)
        {
            NSNumber *vendor = vid[@"vendor"];
            NSNumber *application = vid[@"application"];
            NSNumber *acc_application = vid[@"acc-application"];

           UMDiameterAvpVendor_Specific_Application_Id *aid = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];
            if(vendor != NULL)
            {
                aid.var_vendor_id = [[UMDiameterAvpVendor_Id alloc]initWithObject:vendor];
            }
            if(application != NULL)
            {
                aid.var_auth_application_id =  [[UMDiameterAvpAuth_Application_Id alloc]initWithObject:application];
            }
            if(acc_application!= NULL)
            {
                aid.var_acct_application_id =  [[UMDiameterAvpAcct_Application_Id alloc]initWithObject:acc_application];
            }
            [entries addObject:aid];
        }
        packet.var_vendor_specific_application_id = entries;
    }

    // [ Firmware-Revision ]
    if(_router.firmwareRevision!=NULL)
    {
        packet.var_firmware_revision =  [[UMDiameterAvpFirmware_Revision alloc]initWithObject:_router.firmwareRevision];
    }
    return packet;
}

- (void)sendDWA:(uint32_t)hopByHop
       endToEnd:(uint32_t)endToEnd
     resultCode:(uint32_t)resultCode
   errorMessage:(NSString *)errorMessage
      failedAvp:(NSArray *)failedAvp

{
    UMDiameterPacket *p = [self createDWA:hopByHop
                                 endToEnd:endToEnd
                               resultCode:resultCode
                             errorMessage:errorMessage
                                failedAvp:failedAvp];
    [self sendPacket:p];
    _lastIncomingWatchdogAnswerSent = [NSDate date];
}


- (UMDiameterPacket *)createDWA:(uint32_t)hopByHop
                       endToEnd:(uint32_t)endToEnd
                     resultCode:(uint32_t)resultCode
                   errorMessage:(NSString *)errorMessage
                      failedAvp:(NSArray *)failedAvp

{
    UMDiameterPacketDWA *packet = [[UMDiameterPacketDWA alloc]init];
    packet.version = 1;
    packet.commandFlags = 0;
    packet.commandCode = UMDiameterCommandCode_Device_Watchdog;
    packet.applicationId = UMDiameterApplicationId_Diameter_Common_Messages;
    packet.hopByHopIdentifier = hopByHop;
    packet.endToEndIdentifier = endToEnd;

    // { Origin-Host }
    if(_router.localHostName.length  > 0)
    {
       packet.var_origin_host= [[UMDiameterAvpOrigin_Host alloc]initWithString:_router.localHostName];
    }
    // { Origin-Realm }
    if(_router.localRealm.length > 0)
    {
        packet.var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]initWithString:_router.localRealm];
    }

    //     [ Error-Message ]
    if(errorMessage.length > 0)
    {
        packet.var_error_message =  [[UMDiameterAvpError_Message alloc]initWithString:errorMessage];
    }
    // [ Failed-AVP ]
    if(failedAvp)
    {
        packet.var_failed_avp =  [[UMDiameterAvpFailed_AVP alloc]init];
        [packet.var_failed_avp setArray:failedAvp];
    }

    if(_originStateId!=NULL)
    {
        packet.var_origin_state_id = [[UMDiameterAvpOrigin_State_Id alloc]initWithObject:_originStateId];
    }
    return packet;
}


- (void)sendCEA:(uint32_t)hopByHop
       endToEnd:(uint32_t)endToEnd
     resultCode:(uint32_t)resultCode
   errorMessage:(NSString *)errorMessage
      failedAvp:(NSArray *)failedAvp
{
    UMDiameterPacket *p = [self createCEA:hopByHop
                                 endToEnd:endToEnd
                               resultCode:resultCode
                             errorMessage:errorMessage
                                failedAvp:failedAvp];
    [self sendPacket:p];
}

- (UMDiameterPacket *)createCEA:(uint32_t)hopByHop
                       endToEnd:(uint32_t)endToEnd
                     resultCode:(uint32_t)resultCode
                   errorMessage:(NSString *)errorMessage
                      failedAvp:(NSArray<UMDiameterAVP *>*)failedAvp

{

    UMDiameterPacketCEA * packet = [[UMDiameterPacketCEA alloc]init];
    packet.version = 1;
    packet.commandFlags = 0;
    packet.commandCode = UMDiameterCommandCode_Capabilities_Exchange;
    packet.applicationId = UMDiameterApplicationId_Diameter_Common_Messages;
    packet.hopByHopIdentifier = hopByHop;
    packet.endToEndIdentifier = endToEnd;

    packet.var_result_code = [[UMDiameterAvpResult_Code alloc]initWithObject:@(resultCode)];
    if(resultCode != UMDiameterResultCode_DIAMETER_SUCCESS)
    {
        packet.commandFlags |= UMDiameterCommandFlag_Error;
    }

    packet.var_origin_host  = [[UMDiameterAvpOrigin_Host alloc]initWithString:_router.localHostName];
    packet.var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]initWithString:_router.localRealm];

    NSArray *addrs = _sctp.configured_local_addresses;
    NSMutableArray<UMDiameterAvpHost_IP_Address *> *hosts = [[NSMutableArray alloc]init];
    for (NSString *addr in addrs)
    {
        UMDiameterAvpHost_IP_Address *avp =  [[UMDiameterAvpHost_IP_Address alloc]initWithString:addr];
        [hosts addObject:avp];
    }
    packet.var_host_ip_address = hosts;

    packet.var_vendor_id = [[UMDiameterAvpVendor_Id alloc]initWithObject:@(_router.vendorId)];
    packet.var_product_name = [[UMDiameterAvpProduct_Name alloc]initWithString:_router.productName];
    if(_originStateId!=NULL)
    {
        packet.var_origin_state_id = [[UMDiameterAvpOrigin_State_Id alloc]initWithObject:_originStateId];
    }
    if(errorMessage.length > 0)
    {
        packet.var_error_message = [[UMDiameterAvpError_Message alloc]initWithString:errorMessage];
    }
    if(failedAvp)
    {
        packet.var_failed_avp =  [[UMDiameterAvpFailed_AVP alloc]init];
        [packet.var_failed_avp setArray:failedAvp];
    }

    if([_router.supportedVendorIds count] > 0)
    {
        NSMutableArray<UMDiameterAvpSupported_Vendor_Id *>*arr =  [[NSMutableArray alloc]init];
        for(NSNumber *n in _router.supportedVendorIds)
        {
            UMDiameterAvpSupported_Vendor_Id *avp =  [[UMDiameterAvpSupported_Vendor_Id alloc]initWithObject:n];
            [arr addObject:avp];
        }
        packet.var_supported_vendor_id = arr;
    }
    if([_router.authApplicationIds count] > 0)
    {
        NSMutableArray<UMDiameterAvpAuth_Application_Id *> *arr = [[NSMutableArray alloc]init];
        for(NSNumber *n in _router.authApplicationIds)
        {
            UMDiameterAvpAuth_Application_Id *avp =  [[UMDiameterAvpAuth_Application_Id alloc]initWithObject:n];
            [arr addObject:avp];
        }
        packet.var_auth_application_id = arr;
    }
    if([_router.inbandSecurityIds count] > 0)
    {
        NSMutableArray<UMDiameterAvpInband_Security_Id *>*arr =   [[NSMutableArray alloc]init];
        for(NSNumber *n in _router.inbandSecurityIds)
        {
            UMDiameterAvpInband_Security_Id *avp =  [[UMDiameterAvpInband_Security_Id alloc]initWithObject:n];
            [arr addObject:avp];
        }
        packet.var_inband_security_id = arr;
    }
    // [ Firmware-Revision ]
    if(_router.firmwareRevision!= NULL)
    {
        packet.var_firmware_revision =  [[UMDiameterAvpFirmware_Revision alloc]initWithObject:_router.firmwareRevision];
    }
    return packet;
}

- (void)processCER:(UMDiameterPacket *)pkt
{
    uint32_t resultCode = UMDiameterResultCode_DIAMETER_SUCCESS;

    [self sendCEA:pkt.hopByHopIdentifier
         endToEnd:pkt.endToEndIdentifier
       resultCode:resultCode
     errorMessage:NULL
        failedAvp:NULL];
    if(_shouldSendCER)
    {
        _shouldSendCER = NO;
        [self sendCER];
    }
}

- (void)processCEA:(UMDiameterPacket *)pkt
{
}

- (void)processDWR:(UMDiameterPacket *)pkt
{
    _lastIncomingWatchdogRequestReceived = [NSDate date];

    [self sendDWA:pkt.hopByHopIdentifier
         endToEnd:pkt.endToEndIdentifier
       resultCode:UMDiameterResultCode_DIAMETER_SUCCESS
     errorMessage:NULL
        failedAvp:NULL];

}

- (void)processDWA:(UMDiameterPacket *)pkt
{
    _lastOutgoingWatchdogAnswerReceived = [NSDate date];
}

- (void)processASR:(UMDiameterPacket *)pkt
{
}
- (void)processACR:(UMDiameterPacket *)pkt
{
}
- (void)processDPR:(UMDiameterPacket *)pkt
{
}
- (void)processRAR:(UMDiameterPacket *)pkt
{
}
- (void)processSTR:(UMDiameterPacket *)pkt
{
}

- (void)processDCR:(UMDiameterPacket *)pkt
{
    /* disconnect request */
}

- (void)processDCA:(UMDiameterPacket *)pkt
{
}



/***** ACTIONS *****/

/* Snd-Conn-Req: A transport connection is initiated with the peer. */
- (void)actionI_Snd_Conn_Req:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}

/* Accept: The incoming connection associated with the R-Conn-CER is accepted as the responder connection.*/
- (void)actionR_Accept:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}

/* Reject: The incoming connection associated with the R-Conn-CER is disconnected.*/
- (void)actionReject:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Process-CER:  The CER associated with the R-Conn-CER is processed. */
- (void)actionProcess_CER:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Snd-CER        A CER message is sent to the peer. */
- (void)actionSnd_CER:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Snd-CEA        A CEA message is sent to the peer. */
- (void)actionSnd_CEA:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Cleanup: If necessary, the connection is shut down, and any local resources are freed. */
- (void)actionCleanup:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Error: The transport layer connection is disconnected, either politely or abortively, in response to, an error condition.  Local resources are freed. */
- (void)actionError:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Process-CEA    A received CEA is processed. */
- (void)actionProcess_CEA:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Snd-DPR A DPR message is sent to the peer. */
- (void)actionSnd_DPR:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Snd-DPA A DPA message is sent to the peer. */
- (void)actionSnd_DPA:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}



/* Disc: The transport layer connection is disconnected, and local resources are freed. */
- (void)actionDisc:(UMDiameterPacket *)message
{
    [self actionI_Disc:message];
    [self actionR_Disc:message];
}

- (void)actionI_Disc:(UMDiameterPacket *)message
{
    [_sctp_i closeFor:self];
}

- (void)actionR_Disc:(UMDiameterPacket *)message
{
    [_sctp_r closeFor:self];
}


/* Elect: An election occurs (see Section 5.6.4 for more information). */
- (void)actionElect:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Snd-Message    A message is sent. */
- (void)actionSnd_Message:(UMDiameterPacket *)message
{
    if([_peerState isKindOfClass:[UMDiameterPeerState_I_Open class]])
    {
        [self actionI_Snd_Message:message];
    }
    else if([_peerState isKindOfClass:[UMDiameterPeerState_R_Open class]])
    {
        [self actionR_Snd_Message:message];
    }
}
- (void)actionI_Snd_Message:(UMDiameterPacket *)message
{
    [message beforeEncode];
    NSData *packedData = [message packedData];

    [_sctp_i dataFor:self
                data:packedData
            streamId:0
          protocolId:DIAMETER_SCTP_PPID_CLEAR
          ackRequest:NULL];
}

- (void)actionR_Snd_Message:(UMDiameterPacket *)message
{
    [message beforeEncode];
    NSData *packedData = [message packedData];

    [_sctp_r dataFor:self
                data:packedData
            streamId:0
          protocolId:DIAMETER_SCTP_PPID_CLEAR
          ackRequest:NULL];
}


/* Snd-DWR        A DWR message is sent. */
- (void)actionSnd_DWR:(UMDiameterPacket *)message
{
    if([_peerState isKindOfClass:[UMDiameterPeerState_I_Open class]])
    {
        [self actionI_Snd_DWR:message];
    }
    else if([_peerState isKindOfClass:[UMDiameterPeerState_R_Open class]])
    {
        [self actionR_Snd_DWR:message];
    }
}

- (void)actionI_Snd_DWR:(UMDiameterPacket *)message
{
}

- (void)actionR_Snd_DWR:(UMDiameterPacket *)message
{
}


/* Snd-DWA        A DWA message is sent. */
- (void)actionSnd_DWA:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Process-DWR    The DWR message is serviced. */
- (void)actionProcess_DWR:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Process-DWA    The DWA message is serviced. */
- (void)actionProcess_DWA:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


/* Process        A message is serviced. */
- (void)actionProcess:(UMDiameterPacket *)message
{
    /* FIXME: to be implemented */
}


@end

