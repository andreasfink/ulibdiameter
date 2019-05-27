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

#import "UMDiameterAvpAll.h"

@implementation UMDiameterPeer

- (UMDiameterPeer *)init
{
    self = [super init];
    if(self)
    {
        _peerState = [[UMDiameterPeerState_off alloc]init];
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
    _sctpStatus = s;
    switch(_sctpStatus)
    {
        case  SCTP_STATUS_M_FOOS:
            _peerState = [_peerState eventSctpForcedOutOfService:self];
            break;
        case SCTP_STATUS_OFF:
            _peerState = [_peerState eventSctpOff:self];
            break;
        case SCTP_STATUS_OOS:
            _peerState = [_peerState eventSctpOutOfService:self];
            break;
        case SCTP_STATUS_IS:
            _peerState = [_peerState eventSctpInService:self];
            break;
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
        NSLog(@"can not decode SCTP packet\n\tstream:%d\n\tprotocol:%d\n\tpacket: %@",(int)sid, (int)pid, [d hexString]);
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
        UMDiameterAvpOriginHost *avp = [[UMDiameterAvpOriginHost alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.localHostName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }
    // { Origin-Realm }
    if(1)
    {
        UMDiameterAvpOriginRealm *avp = [[UMDiameterAvpOriginRealm alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.localRealm  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }

    // 1* { Host-IP-Address }
    if(0)
    {
    }
    // { Vendor-Id }
    if(1)
    {
        UMDiameterAvpVendorId *avp = [[UMDiameterAvpVendorId alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.vendorId  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }
    // { Product-Name }
    if(1)
    {
        UMDiameterAvpProductName *avp = [[UMDiameterAvpProductName alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.productName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }

    // [ Origin-State-Id ]
    if(_originStateId)
    {
        UMDiameterAvpOriginStateId *avp =  [[UMDiameterAvpOriginStateId alloc]init];
        [avp setFlagMandatory:NO];
        [avp setNumber:_originStateId];
        [packet appendAvp:avp];
    }

    // * [ Supported-Vendor-Id ]
    if([_router.supportedVendorIds count] > 0)
    {
        NSArray *a = [_router.supportedVendorIds arrayCopy];
        for(NSNumber *n in a)
        {
            UMDiameterAvpSupportedVendorId *avp =  [[UMDiameterAvpSupportedVendorId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n];
            [packet appendAvp:avp];
        }
    }
    // * [ Auth-Application-Id ]
    if([_router.authApplicationIds count] > 0)
    {
        NSArray *a = [_router.authApplicationIds arrayCopy];
        for(NSNumber *n in a)
        {
            UMDiameterAvpAuthApplicationId *avp =  [[UMDiameterAvpAuthApplicationId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n];
            [packet appendAvp:avp];
        }
    }

    // * [ Inband-Security-Id ]
    if([_router.inbandSecurityIds count] > 0)
    {
        NSArray *a = [_router.inbandSecurityIds arrayCopy];
        for(NSNumber *n in a)
        {
            UMDiameterAvpInbandSecurityId *avp =  [[UMDiameterAvpInbandSecurityId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n]; /* NO_INBAND_SECURITY */
            [packet appendAvp:avp];
        }
    }

#if 0
    // * [ Vendor-Specific-Application-Id ]
    if([_router.vendorSpecificIds count] > 0)
    {
        NSArray *a = [_router.vendorSpecificIds arrayCopy];
        UMDiameterAvpVendorSpecificApplicationId *avp =  [[UMDiameterAvpVendorSpecificApplicationId alloc]init];

        for(NSNumber *n in a)
        {
            UMDiameterVendorSpecificApplicationId *avp1 =  [[UMDiameterAvpVendorSpecificApplicationId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n];
            [packet appendAvp:avp];
        }
    }
#endif

    // [ Firmware-Revision ]
    if(_router.firmwareRevision)
    {
        UMDiameterAvpFirmwareRevision *avp =  [[UMDiameterAvpFirmwareRevision alloc]init];
        [avp setFlagMandatory:NO];
        [avp setNumber:_router.firmwareRevision];
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

    // { Result-Code }
    if(1)
    {
        UMDiameterAvpResultCode *avp = [[UMDiameterAvpResultCode alloc]init];
        [avp setFlagMandatory:YES];
        [avp setNumber:@(resultCode)];
        [packet appendAvp:avp];
    }

    // { Origin-Host }
    if(1)
    {
        UMDiameterAvpOriginHost *avp = [[UMDiameterAvpOriginHost alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData = [_router.localHostName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }
    // { Origin-Realm }
    if(1)
    {
        UMDiameterAvpOriginRealm *avp = [[UMDiameterAvpOriginRealm alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.localRealm  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }

    // 1* { Host-IP-Address }
    if(0)
    {
    }

    // { Vendor-Id }
    if(1)
    {
        UMDiameterAvpVendorId *avp = [[UMDiameterAvpVendorId alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.vendorId  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }
    // { Product-Name }
    if(1)
    {
        UMDiameterAvpProductName *avp = [[UMDiameterAvpProductName alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_router.productName  dataUsingEncoding:NSUTF8StringEncoding];
        [packet appendAvp:avp];
    }

    // [ Origin-State-Id ]
    if(_originStateId)
    {
        UMDiameterAvpOriginStateId *avp =  [[UMDiameterAvpOriginStateId alloc]init];
        [avp setFlagMandatory:NO];
        [avp setNumber:_originStateId];
        [packet appendAvp:avp];
    }

    //     [ Error-Message ]
    if(errorMessage.length > 0)
    {
        UMDiameterAvpErrorMessage *avp =  [[UMDiameterAvpErrorMessage alloc]init];
        [avp setFlagMandatory:NO];
        [avp setValue:errorMessage];
        [packet appendAvp:avp];
    }

    // [ Failed-AVP ]
    if(failedAvp)
    {
        UMDiameterAvpFailedAvp *avp =  [[UMDiameterAvpFailedAvp alloc]init];
        [avp setFlagMandatory:NO];
        [avp setArray:failedAvp];
        [packet appendAvp:avp];
    }

    // * [ Supported-Vendor-Id ]
    if([_router.supportedVendorIds count] > 0)
    {
        NSArray *a = [_router.supportedVendorIds arrayCopy];
        for(NSNumber *n in a)
        {
            UMDiameterAvpSupportedVendorId *avp =  [[UMDiameterAvpSupportedVendorId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n];
            [packet appendAvp:avp];
        }
    }
    // * [ Auth-Application-Id ]
    if([_router.authApplicationIds count] > 0)
    {
        NSArray *a = [_router.authApplicationIds arrayCopy];
        for(NSNumber *n in a)
        {
            UMDiameterAvpAuthApplicationId *avp =  [[UMDiameterAvpAuthApplicationId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n];
            [packet appendAvp:avp];
        }
    }

    // * [ Inband-Security-Id ]
    if([_router.inbandSecurityIds count] > 0)
    {
        NSArray *a = [_router.inbandSecurityIds arrayCopy];
        for(NSNumber *n in a)
        {
            UMDiameterAvpInbandSecurityId *avp =  [[UMDiameterAvpInbandSecurityId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n]; /* NO_INBAND_SECURITY */
            [packet appendAvp:avp];
        }
    }

    // * [ Acct-Application-Id ]
#if 0
    if([_router.inbandSecurityIds count] > 0)
    {
        NSArray *a = [_router.inbandSecurityIds arrayCopy];
        for(NSNumber *n in a)
        {
            UMDiameterAvpInbandSecurityId *avp =  [[UMDiameterAvpInbandSecurityId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n];
            [packet appendAvp:avp];
        }
    }
#endif


#if 0
    // * [ Vendor-Specific-Application-Id ]
    if([_router.vendorSpecificIds count] > 0)
    {
        NSArray *a = [_router.vendorSpecificIds arrayCopy];
        UMDiameterAvpVendorSpecificApplicationId *avp =  [[UMDiameterAvpVendorSpecificApplicationId alloc]init];

        for(NSNumber *n in a)
        {
            UMDiameterVendorSpecificApplicationId *avp1 =  [[UMDiameterAvpVendorSpecificApplicationId alloc]init];
            [avp setFlagMandatory:YES];
            [avp setNumber:n];
            [packet appendAvp:avp];
        }
    }
#endif

    // [ Firmware-Revision ]
    if(_router.firmwareRevision)
    {
        UMDiameterAvpFirmwareRevision *avp =  [[UMDiameterAvpFirmwareRevision alloc]init];
        [avp setFlagMandatory:NO];
        [avp setNumber:_router.firmwareRevision];
        [packet appendAvp:avp];
    }

    return packet;
}

@end

