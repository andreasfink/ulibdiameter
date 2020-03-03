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
#import "UMDiameterPacketDPR.h"
#import "UMDiameterPacketDPA.h"
#import "UMDiameterAvpAll.h"

#define     SEND_ORIGIN_STATE_ID_IN_DWR 1
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
        
        _outstandingWatchdogEvents = 0;
        _maxOutstandingWatchdogEvents = 3;
        _watchdogTimer = [[UMTimer alloc]initWithTarget:self
                                               selector:@selector(watchdogTimerEvent)
                                                 object:NULL
                                                seconds:10
                                                   name:@"watchdog-timer"
                                                repeats:YES];
        _housekeepingTimer = [[UMTimer alloc]initWithTarget:self
                                               selector:@selector(housekeeping)
                                                 object:NULL
                                                seconds:5
                                                   name:@"housekeeping"
                                                repeats:YES];
        [_housekeepingTimer start];
    }
    return self;
}

- (void) watchdogTimerEvent
{
    [_peerState eventWatchdogTimer:self message:NULL];
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
                _peerState = [_peerState eventI_Rcv_Conn_Nack:self message:NULL];
            }
            else
            {
                _peerState = [_peerState eventR_Rcv_Conn_Nack:self message:NULL];
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
        [self.logFeed majorErrorText:s];
        [self actionError:NULL];
        //_peerState = [_peerState eventError:self message:NULL];
    }
    if((pid!=0) && (pid!=DIAMETER_SCTP_PPID_CLEAR))
    {
        NSString *s = [NSString stringWithFormat:@"Unsupported protocol ID for Diameter. PID=%d", (int)pid];
        [self.logFeed majorError:0 withText:s];
        [self actionError:NULL];
        // _peerState = [_peerState eventStop:self];
    }

    BOOL defaultProcessing = NO;
    /* REQUESTS */
    if(packet.commandFlags & UMDiameterCommandFlag_Request)
    {
        switch(packet.applicationId)
        {
            case UMDiameterApplicationId_Diameter_Common_Messages:
            {
                switch(packet.commandCode)
                {
                    case UMDiameterCommandCode_Capabilities_Exchange:
                    {
                        if(initiator)
                        {
                            _peerState = [_peerState eventI_Rcv_CER:self message:packet];
                        }
                        else
                        {
                            _peerState = [_peerState eventR_Rcv_CER:self message:packet];
                        }
                        break;
                    }
                    case UMDiameterCommandCode_Disconnect_Peer:
                    {
                        if(initiator)
                        {
                            _peerState = [_peerState eventI_Rcv_DPR:self message:packet];
                        }
                        else
                        {
                            _peerState = [_peerState eventR_Rcv_DPR:self message:packet];
                        }
                        break;
                    }
                    case UMDiameterCommandCode_Device_Watchdog:
                    {
                        if(initiator)
                        {
                            _peerState = [_peerState eventI_Rcv_DWR:self message:packet];
                        }
                        else
                        {
                            _peerState = [_peerState eventR_Rcv_DWR:self message:packet];
                        }
                        break;
                    }
                    default:
                    {
                        defaultProcessing = YES;
                        break;
                    }
                }
                break;
            }
            default:
            {
                defaultProcessing = YES;
                break;
            }
        }
    }
    else if(!(packet.commandFlags & UMDiameterCommandFlag_Error)) /* ANSWER */
    {
        switch(packet.applicationId)
        {
            case UMDiameterApplicationId_Diameter_Common_Messages:
            {
                switch(packet.commandCode)
                {
                    case UMDiameterCommandCode_Capabilities_Exchange:
                    {
                        if(initiator)
                        {
                            _peerState = [_peerState eventI_Rcv_CEA:self message:packet];
                        }
                        else
                        {
                            _peerState = [_peerState eventR_Rcv_CEA:self message:packet];
                        }
                        break;
                    }
                    case UMDiameterCommandCode_Disconnect_Peer:
                    {
                        if(initiator)
                        {
                            _peerState = [_peerState eventI_Rcv_DPA:self message:packet];
                        }
                        else
                        {
                            _peerState = [_peerState eventR_Rcv_DPA:self message:packet];
                        }
                        break;
                    }
                    case UMDiameterCommandCode_Device_Watchdog:
                    {
                        if(initiator)
                        {
                            _peerState = [_peerState eventI_Rcv_DWA:self message:packet];
                        }
                        else
                        {
                            _peerState = [_peerState eventR_Rcv_DWA:self message:packet];
                        }
                        break;
                    }
                    default:
                    {
                        defaultProcessing = YES;
                        break;
                    }
                }
                break;
            }
            default:
            {
                defaultProcessing = YES;
                break;
            }
        }
    }
    else if(packet.commandFlags & UMDiameterCommandFlag_Error)
    {
        switch(packet.applicationId)
        {
            case UMDiameterApplicationId_Diameter_Common_Messages:
            {
                switch(packet.commandCode)
                {
                    case UMDiameterCommandCode_Capabilities_Exchange:
                    {
                        NSString *s = [NSString stringWithFormat:@"Capabilities Exchange Error: %@",packet.dictionaryValue.jsonString];
                        [self logMajorError:s];
                        break;
                    }
                    case UMDiameterCommandCode_Disconnect_Peer:
                    {
                        NSString *s = [NSString stringWithFormat:@"Disconnect Peer Error: %@",packet.dictionaryValue.jsonString];
                        [self logMajorError:s];
                        break;
                    }
                    case UMDiameterCommandCode_Device_Watchdog:
                    {
                        NSString *s = [NSString stringWithFormat:@"Device Watchdog Error: %@",packet.dictionaryValue.jsonString];
                        [self logMajorError:s];
                        break;
                    }
                    default:
                    {
                        defaultProcessing =YES;
                        break;
                    }
                }
            }
            default:
            {
                defaultProcessing =YES;
                break;
            }
        }
    }
    if(defaultProcessing)
    {
        if(initiator)
        {
            _peerState = [_peerState eventI_Rcv_Message:self message:packet];
        }
        else
        {
            _peerState = [_peerState eventR_Rcv_Message:self message:packet];
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
    if(cfg[@"attach-responder-to"])
    {
        NSString *attachTo =  [cfg[@"attach-responder-to"] stringValue];
        _sctp_r = [appContext getSCTP:attachTo];
        if(_sctp_r == NULL)
        {
            NSString *s = [NSString stringWithFormat:@"Can not find sctp_r layer '%@' referred from diameter layer '%@'",attachTo,self.layerName];
            @throw([NSException exceptionWithName:[NSString stringWithFormat:@"CONFIG_ERROR FILE %s line:%ld",__FILE__,(long)__LINE__]
                                           reason:s
                                         userInfo:NULL]);
        }
    }
    if(cfg[@"attach-initiator-to"])
    {
        NSString *attachTo =  [cfg[@"attach-initiator-to"] stringValue];
        _sctp_i = [appContext getSCTP:attachTo];
        if(_sctp_i == NULL)
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
    [_sctp_i adminAttachFor:self profile:profile userId:self.layerName];
    [_sctp_r adminAttachFor:self profile:profile userId:self.layerName];
}

- (void)stopDetachAndDestroy
{
    [_peerState eventStop:self message:NULL];
}

- (void)powerOn
{
    [_peerState eventStart:self message:NULL];
}

- (void)powerOff
{
    [_peerState eventStop:self message:NULL];
}

- (uint32_t)nextHopByHopIdentifier

{
    uint32_t r;
    [_nextHopIdentifierLock lock];
    r = ++_lastHopByHopIdentifier;
    [_nextHopIdentifierLock unlock];
    return r;
}

/* this is called from local */
- (void)sendMessage:(UMDiameterPacket *)packet
{
    [_peerState eventSend_Message:self message:packet];
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
    NSArray *addrs = _sctp_r.configured_local_addresses;
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


- (UMDiameterPacket *)createDWR
{
    UMDiameterPacketDWR *packet = [[UMDiameterPacketDWR alloc]init];
    packet.hopByHopIdentifier = [self nextHopByHopIdentifier];
    packet.endToEndIdentifier = [_router nextEndToEndIdentifier];
    /*
       { Origin-Host }
       { Origin-Realm }
       [ Origin-State-Id ]
       *[ AVP ]
     */
    //     { Origin-Host }
    if(_router.localHostName.length > 0)
    {
        packet.var_origin_host = [[UMDiameterAvpOrigin_Host alloc]initWithString:_router.localHostName];
    }
    //      { Origin-Realm }
    if(_router.localRealm.length > 0)
    {
        packet.var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]initWithString:_router.localRealm];
    }
#ifdef SEND_ORIGIN_STATE_ID_IN_DWR
    //   [ Origin-State-Id ]
    {
        packet.var_origin_state_id = [[UMDiameterAvpOrigin_State_Id alloc]init];
        packet.var_origin_state_id.value = _router.origin_state_id;
    }
#endif
    return packet;
}

- (UMDiameterPacket *)createDWA:(uint32_t)hopByHop
                       endToEnd:(uint32_t)endToEnd
                     resultCode:(NSNumber *)resultCode
                   errorMessage:(NSString *)errorMessage
                      failedAvp:(NSArray *)failedAvp

{
    UMDiameterPacketDWA *packet = [[UMDiameterPacketDWA alloc]init];
    packet.hopByHopIdentifier = hopByHop;
    packet.endToEndIdentifier = endToEnd;

    if(resultCode)
    {
        packet.var_result_code = [[UMDiameterAvpResult_Code alloc]init];
        packet.var_result_code.value = resultCode.unsignedIntValue;
    }
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

- (UMDiameterPacket *)createDPRwithDisconnectCause:(NSNumber *)dcause
{
    UMDiameterPacketDPR *packet = [[UMDiameterPacketDPR alloc]init];
    packet.hopByHopIdentifier = [self nextHopByHopIdentifier];
    packet.endToEndIdentifier = [_router nextEndToEndIdentifier];
    // { Origin-Host }
    if(_router.localHostName.length > 0)
    {
        packet.var_origin_host = [[UMDiameterAvpOrigin_Host alloc]initWithString:_router.localHostName];
    }
    // { Origin-Realm }
    if(_router.localRealm.length > 0)
    {
        packet.var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]initWithString:_router.localRealm];
    }
    if(dcause)
    {
        packet.var_disconnect_cause = [[UMDiameterAvpDisconnect_Cause alloc]init];
        packet.var_disconnect_cause.value = [dcause intValue];
    }
    return packet;
}

- (UMDiameterPacket *)createDPA:(uint32_t)hopByHop
                       endToEnd:(uint32_t)endToEnd
                     resultCode:(NSNumber *)resultCode
                   errorMessage:(NSString *)errorMessage
                      failedAvp:(NSArray *)failedAvp

{
    UMDiameterPacketDWA *packet = [[UMDiameterPacketDWA alloc]init];
    packet.hopByHopIdentifier = hopByHop;
    packet.endToEndIdentifier = endToEnd;

    // { Result-Code }
    if(resultCode)
    {
        packet.var_result_code = [[UMDiameterAvpResult_Code alloc]init];
        packet.var_result_code.value = [resultCode unsignedIntValue];
    }
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

    // [ Error-Message ]
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


- (UMDiameterPacket *)createCEA:(uint32_t)hopByHop
                       endToEnd:(uint32_t)endToEnd
                     resultCode:(NSNumber *)resultCode
                   errorMessage:(NSString *)errorMessage
                      failedAvp:(NSArray<UMDiameterAVP *>*)failedAvp

{
    UMDiameterPacketCEA * packet = [[UMDiameterPacketCEA alloc]init];
    packet.hopByHopIdentifier = hopByHop;
    packet.endToEndIdentifier = endToEnd;

    if(resultCode)
    {
        packet.var_result_code = [[UMDiameterAvpResult_Code alloc]init];
        packet.var_result_code.value = [resultCode unsignedIntValue];
        if(resultCode.unsignedIntValue != UMDiameterResultCode_DIAMETER_SUCCESS)
        {
            packet.commandFlags |= UMDiameterCommandFlag_Error;
        }
    }
    if(_router.localHostName.length > 0)
    {
        packet.var_origin_host  = [[UMDiameterAvpOrigin_Host alloc]initWithString:_router.localHostName];
    }
    if(_router.localRealm)
    {
        packet.var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]initWithString:_router.localRealm];
    }
    NSArray *addrs = _sctp_r.configured_local_addresses;
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

/***** ACTIONS *****/

/* Snd-Conn-Req: A transport connection is initiated with the peer. */
- (void)actionI_Snd_Conn_Req:(UMDiameterPacket *)message
{
    [_sctp_i openFor:self];
}

/* Accept: The incoming connection associated with the R-Conn-CER is accepted as the responder connection.*/
- (void)actionR_Accept:(UMDiameterPacket *)message
{
    /* FIXME:  [_sctp_r accept:self]; */
}

/* Reject: The incoming connection associated with the R-Conn-CER is disconnected.*/
- (void)actionReject:(UMDiameterPacket *)message
{
    [_sctp_r closeFor:self];
}

- (void)actionR_Reject:(UMDiameterPacket *)message
{
    [_sctp_r closeFor:self];
}

/* Process-CER:  The CER associated with the R-Conn-CER is processed. */
- (void)actionProcess_CER:(UMDiameterPacket *)message
{
    if(_logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:message.objectValue.jsonString];
    }
    /* FIXME: do something useful here */
}


/* Snd-CER        A CER message is sent to the peer. */
- (void)actionSnd_CER:(UMDiameterPacket *)message
{
    [self actionI_Snd_CER:message];
    /* there is no R_Snd_CER */
}

- (void)actionI_Snd_CER:(UMDiameterPacket *)message
{
    if(message==NULL)
    {
        message = [self createCER];
    }
    [self actionI_Snd_Message:message];
}



/* Snd-CEA        A CEA message is sent to the peer. */
- (void)actionSnd_CEA:(UMDiameterPacket *)message
{
    [self actionR_Snd_CEA:message];
    /* there is no I_Snd_CEA */
}

- (void)actionR_Snd_CEA:(UMDiameterPacket *)message
{
    [self actionR_Snd_Message:message];
}

/* Cleanup: If necessary, the connection is shut down, and any local resources are freed. */
- (void)actionCleanup:(UMDiameterPacket *)message
{
    /* FIXME: do something useful here */
}


/* Error: The transport layer connection is disconnected, either politely or abortively, in response to, an error condition.  Local resources are freed. */
- (void)actionError:(UMDiameterPacket *)message
{
    [_sctp_i closeFor:self];
    [_sctp_r closeFor:self];
    _peerState = [[UMDiameterPeerState_Closed alloc]init];
}


/* Process-CEA    A received CEA is processed. */
- (void)actionProcess_CEA:(UMDiameterPacket *)message
{
    if(_logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:message.objectValue.jsonString];
    }
    /* FIXME: do something useful here */
}


/* Snd-DPR A DPR message is sent to the peer. */

- (void)actionR_Snd_DPR:(UMDiameterPacket *)message
{
    UMAssert(message,@"Message can not be null here");
    [self actionR_Snd_Message:message];
}

- (void)actionI_Snd_DPR:(UMDiameterPacket *)message
{
    UMAssert(message,@"Message can not be null here");
    [self actionI_Snd_Message:message];
}

/* Snd-DPA A DPA message is sent to the peer. */

- (void)actionR_Snd_DPA:(UMDiameterPacket *)message
{
    UMAssert(message,@"Message can not be null here");
    [self actionR_Snd_Message:message];
}

- (void)actionI_Snd_DPA:(UMDiameterPacket *)message
{
    UMAssert(message,@"Message can not be null here");
    [self actionI_Snd_Message:message];
}

/* Snd-DWA        A DWA message is sent. */
- (void)actionI_Snd_DWA:(UMDiameterPacket *)message
{
    _lastWatchdogAnswerSent = [NSDate date];
    [self actionI_Snd_Message:message];
}

- (void)actionR_Snd_DWA:(UMDiameterPacket *)message
{
    _lastWatchdogAnswerSent = [NSDate date];
    [self actionR_Snd_Message:message];
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


typedef enum ElectionResult
{
    ElectionResult_localWins = -1,
    ElectionResult_tie = 0,
    ElectionResult_remoteWins = 1
} ElectionResult;

/* Elect: An election occurs (see Section 5.6.4 for more information). */
- (void)actionElect:(UMDiameterPacket *)message
{
/*
    The election is performed on the responder.  The responder compares
    the Origin-Host received in the CER with its own Origin-Host as two
    streams of octets.  If the local Origin-Host lexicographically
    succeeds the received Origin-Host, a Win-Election event is issued
    locally.  Diameter identities are in ASCII form; therefore, the
    lexical comparison is consistent with DNS case insensitivity, where
    octets that fall in the ASCII range 'a' through 'z' MUST compare
    equally to their uppercase counterparts between 'A' and 'Z'.  See
    Appendix D for interactions between the Diameter protocol and
    Internationalized Domain Name (IDNs).
 
*/
    ElectionResult r = ElectionResult_tie;

    NSArray *a = [message getArrayOfAvpsByCode:[UMDiameterAvpOrigin_Host avpCode]];
    if(a.count > 0)
    {
        NSString *remoteOriginHost = a[0];
        NSString *localOriginHost = _router.localHostName;
        remoteOriginHost = [remoteOriginHost lowercaseString];
        localOriginHost = [localOriginHost lowercaseString];
        NSData *remoteAscii =
        [remoteOriginHost dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSData *localAscii =
        [localOriginHost dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        const uint8_t *rb = (uint8_t *)remoteAscii.bytes;
        size_t rl = remoteAscii.length;
        const uint8_t *lb = (uint8_t *)localAscii.bytes;
        size_t ll = localAscii.length;
        size_t i=0;
        
        while((i<ll) && (i<rl))
        {
            if(rb[i] < lb[i])
            {
                r = ElectionResult_localWins;
                break;
            }
            else if(rb[i] > lb[i])
            {
                r = ElectionResult_remoteWins;
                break;
            }
            i++;
        }
        if(r==ElectionResult_tie)
        {
            if(rl < ll)
            {
                r = ElectionResult_localWins;
            }
            else if(rl > ll)
            {
                r = ElectionResult_remoteWins;
            }
            else
            {
                r = ElectionResult_tie;
            }
        }
    }
    else
    {
        r = ElectionResult_localWins;
    }
    
    /*
        The winner of the election MUST close the connection it initiated.
        Historically, maintaining the responder side of a connection was more
        efficient than maintaining the initiator side.  However, current
        practices makes this distinction irrelevant.
    */
    if(r == ElectionResult_localWins)
    {
        [_sctp_i closeFor:self];
    }
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
    _outstandingWatchdogEvents++;
    UMAssert(message,@"Message can not be null here");
    [self actionI_Snd_Message:message];
}

- (void)actionR_Snd_DWR:(UMDiameterPacket *)message
{
    _outstandingWatchdogEvents++;
    UMAssert(message,@"Message can not be null here");
    [self actionR_Snd_Message:message];
}



/* Process-DWR    The DWR message is serviced. */
- (void)actionProcess_DWR:(UMDiameterPacket *)message
{
    _lastWatchdogRequestReceived = [NSDate date];
}


/* Process-DWA    The DWA message is serviced. */
- (void)actionProcess_DWA:(UMDiameterPacket *)message
{
    _lastWatchdogAnswerReceived = [NSDate date];
    _outstandingWatchdogEvents--;
    [_watchdogTimer stop];
    [_watchdogTimer start];
}


/* Process        A message is serviced. */
- (void)actionProcessMessage:(UMDiameterPacket *)message
{
    [_router processIncomingPacket:message fromPeer:self];
}

- (void)housekeeping
{
    if(_outstandingWatchdogEvents > _maxOutstandingWatchdogEvents)
    {
        [self.logFeed majorErrorText:@"WATCHDOG-KILL"];
        [self actionError:NULL];
    }
}
@end

