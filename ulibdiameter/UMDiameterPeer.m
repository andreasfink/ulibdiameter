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
                       status:(SCTP_Status)s
{
    if(_sctpStatus == s)
    {
        return;
    }
    SCTP_Status previousStatus = _sctpStatus;
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
    _sctpStatus = s;
    switch(_sctpStatus)
    {
        case  SCTP_STATUS_M_FOOS:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->M_FOOS",oldStatusString];
            [self.logFeed infoText:s];
            _peerState = [_peerState eventSctpForcedOutOfService:self];
            break;
        }
        case SCTP_STATUS_OFF:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->OFF",oldStatusString];
            [self.logFeed infoText:s];
            _peerState = [_peerState eventSctpOff:self];
            break;
        }
        case SCTP_STATUS_OOS:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->OOS",oldStatusString];
            [self.logFeed infoText:s];
            _peerState = [_peerState eventSctpOutOfService:self];
            break;
        }
        case SCTP_STATUS_IS:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->IS",oldStatusString];
            [self.logFeed infoText:s];
            _peerState = [_peerState eventSctpInService:self];
            if(_sctp.isPassive==YES)
            {
                _isIncoming = YES;
            }
            else
            {
                [self sendCER];
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
    UMDiameterPacket *packet = [[UMDiameterPacket alloc]initWithData:d];
    if(!packet)
    {
        NSString *s = [NSString stringWithFormat:@"can not decode SCTP packet\n\tstream:%d\n\tprotocol:%d\n\tpacket: %@",(int)sid, (int)pid, [d hexString]];
        NSLog(@"%@",s);
        [self.logFeed majorError:0 withText:s];
        _peerState = [_peerState eventStop:self];
    }
    if((pid!=0) && (pid!=DIAMETER_SCTP_PPID_CLEAR))
    {
        NSString *s = [NSString stringWithFormat:@"Unsupported protocol ID for Diameter. PID=%d", (int)pid];
        NSLog(@"%@",s);
        [self.logFeed majorError:0 withText:s];
        _peerState = [_peerState eventStop:self];
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
                        [self processCEA:packet];
                        break;
                    case UMDiameterCommandCode_Device_Watchdog:
                        [self processDWA:packet];
                        break;
                    case UMDiameterCommandCode_Abort_Session:
                        [self processASR:packet];
                        break;
                    case UMDiameterCommandCode_Accounting:
                        [self processACR:packet];
                        break;
                    case UMDiameterCommandCode_Disconnect_Peer:
                        [self processDPR:packet];
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
    /*
     <CER> ::= < Diameter Header: 257, REQ >
     { Origin-Host }
     { Origin-Realm }
     1* { Host-IP-Address }
     { Vendor-Id }
     { Product-Name }
     [ Origin-State-Id ]
     * [ Supported-Vendor-Id ]
     * [ Auth-Application-Id ]
     * [ Inband-Security-Id ]
     * [ Acct-Application-Id ]
     * [ Vendor-Specific-Application-Id ]
     [ Firmware-Revision ]
     * [ AVP ]
     */

    UMDiameterPacket *packet = [[UMDiameterPacket alloc]init];
    packet.version = 1;
    packet.commandFlags = UMDiameterCommandFlag_Request;
    packet.commandCode = UMDiameterCommandCode_Capabilities_Exchange;
    packet.applicationId = UMDiameterApplicationId_Diameter_Common_Messages;
    packet.hopByHopIdentifier = [self nextHopByHopIdentifier];
    packet.endToEndIdentifier = [_router nextEndToEndIdentifier];

    // { Origin-Host }
    if(1)
    {
        UMDiameterAvpOrigin_Host *avp = [[UMDiameterAvpOrigin_Host alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.localHostName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }
    // { Origin-Realm }
    if(1)
    {
        UMDiameterAvpOrigin_Realm *avp = [[UMDiameterAvpOrigin_Realm alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.localRealm  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }

    // 1* { Host-IP-Address }
    if(1)
    {
        NSArray *addrs = _sctp.configured_local_addresses;
        for (NSString *addr in addrs)
        {
#pragma unused(addr)
            UMDiameterAvpHost_IP_Address *avp =  [[UMDiameterAvpHost_IP_Address alloc]init];
            [avp setFlagMandatory:YES];
 /* FIXME */
            //[avp setHostIPAddress:addr];
            [packet appendAvp:avp];
        }
    }
    // { Vendor-Id }
    if(1)
    {
        UMDiameterAvpVendor_Id *avp = [[UMDiameterAvpVendor_Id alloc]init];
        [avp setFlagMandatory:YES];
        [avp setNumberValue:@(_router.vendorId)];
        [packet appendAvp:avp];
    }
    // { Product-Name }
    if(1)
    {
        UMDiameterAvpProduct_Name *avp = [[UMDiameterAvpProduct_Name alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.productName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }

    // [ Origin-State-Id ]
    if(_originStateId!=NULL)
    {
        UMDiameterAvpOrigin_State_Id *avp =  [[UMDiameterAvpOrigin_State_Id alloc]init];
        [avp setFlagMandatory:NO];
        [avp setNumberValue:_originStateId];
        [packet appendAvp:avp];
    }

    // * [ Supported-Vendor-Id ]
    if([_router.supportedVendorIds count] > 0)
    {
        NSArray *a = _router.supportedVendorIds;
        for(NSNumber *n in a)
        {
            UMDiameterAvpSupported_Vendor_Id *avp =  [[UMDiameterAvpSupported_Vendor_Id alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumberValue:n];
            [packet appendAvp:avp];
        }
    }
    // * [ Auth-Application-Id ]
    if([_router.authApplicationIds count] > 0)
    {
        NSArray *a = _router.authApplicationIds;
        for(NSNumber *n in a)
        {
            UMDiameterAvpAuth_Application_Id *avp =  [[UMDiameterAvpAuth_Application_Id alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumberValue:n];
            [packet appendAvp:avp];
        }
    }

    /* [ Inband-Security-Id ] */
    if([_router.inbandSecurityIds count] > 0)
    {
        NSArray *a = _router.inbandSecurityIds;
        for(NSNumber *n in a)
        {
            UMDiameterAvpInband_Security_Id *avp =  [[UMDiameterAvpInband_Security_Id alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumberValue:n]; /* NO_INBAND_SECURITY */
            [packet appendAvp:avp];
        }
    }

    NSArray<NSDictionary *>*vids = _router.vendorSpecificIds;
    for(NSDictionary *vid in vids)
    {
        NSNumber *vendor = vid[@"vendor"];
        NSNumber *application = vid[@"application"];

        UMDiameterAvpVendor_Specific_Application_Id *avp = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];

        NSMutableArray *entries = [[NSMutableArray alloc]init];

        UMDiameterAvpVendor_Id *avp_vendor = [[UMDiameterAvpVendor_Id alloc]init];
        avp_vendor.numberValue = vendor;
        [entries addObject:avp_vendor];

        UMDiameterAvpAuth_Application_Id *avp_app = [[UMDiameterAvpAuth_Application_Id alloc]init];
        avp_app.numberValue = application;
        [entries addObject:avp_app];

        [avp setArray:entries];
        [packet appendAvp:avp];
    }


    // [ Firmware-Revision ]
    if(_router.firmwareRevision!=NULL)
    {
        UMDiameterAvpFirmware_Revision *avp =  [[UMDiameterAvpFirmware_Revision alloc]init];
        [avp setFlagMandatory:NO];
        [avp setNumberValue:_router.firmwareRevision];
        [packet appendAvp:avp];
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
    /*
     <DWA>  ::= < Diameter Header: 280 >
     { Result-Code }
     { Origin-Host }
     { Origin-Realm }
     [ Error-Message ]
     [ Failed-AVP ]
     [ Origin-State-Id ]
     * [ AVP ]


     */

    UMDiameterPacket *packet = [[UMDiameterPacket alloc]init];
    packet.version = 1;
    packet.commandFlags = 0;
    packet.commandCode = UMDiameterCommandCode_Device_Watchdog;
    packet.applicationId = UMDiameterApplicationId_Diameter_Common_Messages;
    packet.hopByHopIdentifier = hopByHop;
    packet.endToEndIdentifier = endToEnd;

    // { Origin-Host }
    if(1)
    {
        UMDiameterAvpOrigin_Host *avp = [[UMDiameterAvpOrigin_Host alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData = [_router.localHostName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }
    // { Origin-Realm }
    if(1)
    {
        UMDiameterAvpOrigin_Realm *avp = [[UMDiameterAvpOrigin_Realm alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.localRealm  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }


    //     [ Error-Message ]
    if(errorMessage.length > 0)
    {
        UMDiameterAvpError_Message *avp =  [[UMDiameterAvpError_Message alloc]init];
        [avp setFlagMandatory:NO];
        [avp setValue:errorMessage];
        [packet appendAvp:avp];
    }
    // [ Failed-AVP ]
    if(failedAvp)
    {
        UMDiameterAvpFailed_AVP *avp =  [[UMDiameterAvpFailed_AVP alloc]init];
        [avp setFlagMandatory:NO];
        [avp setArray:failedAvp];
        [packet appendAvp:avp];
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
                      failedAvp:(NSArray *)failedAvp

{
    /*
     <CEA> ::= < Diameter Header: 257 >
     { Result-Code }
     { Origin-Host }
     { Origin-Realm }
     1* { Host-IP-Address }
     { Vendor-Id }
     { Product-Name }
     [ Origin-State-Id ]
     [ Error-Message ]
     [ Failed-AVP ]
     * [ Supported-Vendor-Id ]
     * [ Auth-Application-Id ]
     * [ Inband-Security-Id ]
     * [ Acct-Application-Id ]
     * [ Vendor-Specific-Application-Id ]
     [ Firmware-Revision ]
     * [ AVP ]

     */

    UMDiameterPacket *packet = [[UMDiameterPacket alloc]init];
    packet.version = 1;
    packet.commandFlags = 0;
    packet.commandCode = UMDiameterCommandCode_Capabilities_Exchange;
    packet.applicationId = UMDiameterApplicationId_Diameter_Common_Messages;
    packet.hopByHopIdentifier = hopByHop;
    packet.endToEndIdentifier = endToEnd;

    // { Origin-Host }
    if(1)
    {
        UMDiameterAvpOrigin_Host *avp = [[UMDiameterAvpOrigin_Host alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData = [_router.localHostName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }
    // { Origin-Realm }
    if(1)
    {
        UMDiameterAvpOrigin_Realm *avp = [[UMDiameterAvpOrigin_Realm alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.localRealm  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }

    // { Result-Code }
    if(1)
    {
        UMDiameterAvpResult_Code *avp = [[UMDiameterAvpResult_Code alloc]init];
        [avp setFlagMandatory:YES];
        [avp setNumberValue:@(resultCode)];
        [packet appendAvp:avp];
        if(resultCode != UMDiameterResultCode_DIAMETER_SUCCESS)
        {
            packet.commandFlags |= UMDiameterCommandFlag_Error;
        }
    }


    // 1* { Host-IP-Address }
    if(1)
    {
        NSArray *addrs = _sctp.configured_local_addresses;
        for (NSString *addr in addrs)
        {
#pragma unused(addr)

            UMDiameterAvpHost_IP_Address *avp =  [[UMDiameterAvpHost_IP_Address alloc]init];
            [avp setFlagMandatory:YES];
    //        [avp setHostIPAddress:addr]
            [packet appendAvp:avp];
        }
    }

    // { Vendor-Id }
    if(1)
    {
        UMDiameterAvpVendor_Id *avp = [[UMDiameterAvpVendor_Id alloc]init];
        [avp setFlagMandatory:YES];
        [avp setNumberValue:@(_router.vendorId)];
        [packet appendAvp:avp];
    }
    // { Product-Name }
    if(1)
    {
        UMDiameterAvpProduct_Name *avp = [[UMDiameterAvpProduct_Name alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.productName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }

    // [ Origin-State-Id ]
    if(_originStateId!=NULL)
    {
        UMDiameterAvpOrigin_State_Id *avp =  [[UMDiameterAvpOrigin_State_Id alloc]init];
        [avp setFlagMandatory:NO];
        [avp setNumberValue:_originStateId];
        [packet appendAvp:avp];
    }

    //     [ Error-Message ]
    if(errorMessage.length > 0)
    {
        UMDiameterAvpError_Message *avp =  [[UMDiameterAvpError_Message alloc]init];
        [avp setFlagMandatory:NO];
        [avp setValue:errorMessage];
        [packet appendAvp:avp];
    }

    // [ Failed-AVP ]
    if(failedAvp)
    {
        UMDiameterAvpFailed_AVP *avp =  [[UMDiameterAvpFailed_AVP alloc]init];
        [avp setFlagMandatory:NO];
        [avp setArray:failedAvp];
        [packet appendAvp:avp];
    }
    // * [ Supported-Vendor-Id ]
    if([_router.supportedVendorIds count] > 0)
    {
        NSArray *a = [_router supportedVendorIds];
        for(NSNumber *n in a)
        {
            UMDiameterAvpSupported_Vendor_Id *avp =  [[UMDiameterAvpSupported_Vendor_Id alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumberValue:n];
            [packet appendAvp:avp];
        }
    }
    // * [ Inband-Security-Id ]
    if([_router.inbandSecurityIds count] > 0)
    {
        NSArray *a = _router.inbandSecurityIds;
        for(NSNumber *n in a)
        {
            UMDiameterAvpInband_Security_Id *avp =  [[UMDiameterAvpInband_Security_Id alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumberValue:n]; /* NO_INBAND_SECURITY */
            [packet appendAvp:avp];
        }
    }
    // [ Firmware-Revision ]
    if(_router.firmwareRevision)
    {
        UMDiameterAvpFirmware_Revision *avp =  [[UMDiameterAvpFirmware_Revision alloc]init];
        [avp setFlagMandatory:NO];
        [avp setNumberValue:_router.firmwareRevision];
        [packet appendAvp:avp];
    }

    NSArray<NSDictionary *>*vids = _router.vendorSpecificIds;
    for(NSDictionary *vid in vids)
    {
        NSNumber *vendor = vid[@"vendor"];
        NSNumber *application = vid[@"application"];

       UMDiameterAvpVendor_Specific_Application_Id *avp = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];

        NSMutableArray *entries = [[NSMutableArray alloc]init];

        UMDiameterAvpVendor_Id *avp_vendor = [[UMDiameterAvpVendor_Id alloc]init];
        avp_vendor.numberValue = vendor;
        [entries addObject:avp_vendor];

        UMDiameterAvpAuth_Application_Id *avp_app = [[UMDiameterAvpAuth_Application_Id alloc]init];
        avp_app.numberValue = application;
        [entries addObject:avp_app];

        [avp setArray:entries];
        [packet appendAvp:avp];
    }
    // * [ Auth-Application-Id ]
    if([_router.authApplicationIds count] > 0)
    {
        NSArray *a = _router.authApplicationIds;
        for(NSNumber *n in a)
        {
            UMDiameterAvpAuth_Application_Id *avp =  [[UMDiameterAvpAuth_Application_Id alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumberValue:n];
            [packet appendAvp:avp];
        }
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

@end

