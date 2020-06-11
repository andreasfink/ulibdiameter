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
#import "UMDiameterRouter.h"

#import <ulibsctp/ulibsctp.h>
#include <poll.h>

#ifdef __APPLE__
#import <sctp/sctp.h>
#else
#include "netinet/sctp.h"
#endif
#include <arpa/inet.h>

#define     SEND_ORIGIN_STATE_ID_IN_DWR 1

#define RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(sel,obj) \
    [self runSelectorInBackground:sel \
                        withObject:obj \
                         file:__FILE__ line:__LINE__  function:__func__]


#define DIAMETER_LINK_REOPEN_TIME1_DEFAULT  6.0
#define DIAMETER_LINK_REOPEN_TIME2_DEFAULT 120.0
#define DIAMETER_WATCHDOG_TIMER_DEFAULT   30.0

@implementation UMDiameterPeer

- (UMLayer *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq
{
    self =[super initWithTaskQueueMulti:tq];
    if(self)
    {
        [self genericInitialisation];
    }
    return self;
}

- (UMDiameterPeer *)init
{
    self =[super init];
    if(self)
    {
        [self genericInitialisation];
    }
    return self;
}

-(void)genericInitialisation
{
    _peerState = [[UMDiameterPeerState_Closed alloc]init];
    _isConnected = NO;
    _isActive = NO;
    _isConnecting = NO;
    _nextHopIdentifierLock = [[UMMutex alloc]initWithName:@"diameter-peer-next-hop-identifier-lock"];
    _outstandingWatchdogEvents = 0;
    _maxOutstandingWatchdogEvents = 3;
    _responderPort = 5868;
    _initiatorPort = 5868;
    _eventLock = [[UMMutex alloc]initWithName:@"diameter-event-lock"];
    _dataBuffersLock = [[UMMutex alloc]initWithName:@"diameter-data-buffers-lock"];

    _reopen_timer1_value = DIAMETER_LINK_REOPEN_TIME1_DEFAULT;
    _reopen_timer2_value = DIAMETER_LINK_REOPEN_TIME2_DEFAULT;
    _watchdog_timer_value = DIAMETER_WATCHDOG_TIMER_DEFAULT;

    _watchdogTimer = [[UMTimer alloc]initWithTarget:self
                                           selector:@selector(watchdogTimerEvent)
                                             object:NULL
                                            seconds:_watchdog_timer_value
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

#pragma mark -
#pragma mark Event Background tasks

- (void) _watchdogTimerEventTask:(id)obj
{
    [_eventLock lock];
    _peerState = [_peerState eventWatchdogTimer:self message:obj];
    [_eventLock unlock];

}

- (void) _eventI_Rcv_Conn_NackTask:(id)obj
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_Conn_Nack:self message:obj];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_Conn_NackTask:(id)obj
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_Conn_Nack:self message:obj];
    [_eventLock unlock];
}

- (void) _eventI_Rcv_Conn_AckTask:(id)obj
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_Conn_Ack:self message:obj];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_Conn_AckTask:(id)obj
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_Conn_Ack:self message:obj];
    [_eventLock unlock];
}

- (void) _eventI_Rcv_CERTask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_CER:self message:packet];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_CERTask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_CER:self message:packet];
    [_eventLock unlock];
}

- (void) _eventI_Rcv_DPRTask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_DPR:self message:packet];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_DPRTask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_DPR:self message:packet];
    [_eventLock unlock];
}

- (void) _eventI_Rcv_DWRTask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_DWR:self message:packet];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_DWRTask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_DWR:self message:packet];
    [_eventLock unlock];
}

- (void) _eventI_Rcv_CEATask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_CEA:self message:packet];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_CEATask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_CEA:self message:packet];
    [_eventLock unlock];
}

- (void) _eventI_Rcv_DPATask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_DPA:self message:packet];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_DPATask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_DPA:self message:packet];
    [_eventLock unlock];
}

- (void) _eventI_Rcv_DWATask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_DWA:self message:packet];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_DWATask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_DWA:self message:packet];
    [_eventLock unlock];
}

- (void) _eventI_Rcv_MessageTask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventI_Rcv_Message:self message:packet];
    [_eventLock unlock];
}

- (void) _eventR_Rcv_MessageTask:(id)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventR_Rcv_Message:self message:packet];
    [_eventLock unlock];
}


- (void)_eventSend_MessageTask:(UMDiameterPacket *)packet
{
    [_eventLock lock];
    _peerState = [_peerState eventSend_Message:self message:packet];
    [_eventLock unlock];
}

- (void)_eventStopTask:(id)obj
{
    [_eventLock lock];
    _peerState = [_peerState eventStop:self message:obj];
    [_eventLock unlock];
}

- (void)_eventStartTask:(id)obj
{
    [_eventLock lock];
    _peerState =[_peerState eventStart:self message:obj];
    [_eventLock unlock];
}




#pragma mark -
#pragma mark Methods

- (void) watchdogTimerEvent
{
    RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_watchdogTimerEventTask:),NULL);
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

    _tcpPeer = NO;
    if(cfg[@"protocol"])
    {
        NSString *p = [cfg[@"protocol"] stringValue];
        if([p isEqualToStringCaseInsensitive:@"tcp"])
        {
            _tcpPeer = YES;
        }
    }
    
    /* **** */
    if (cfg[@"local-ip"])
    {
         id local_ip_object = cfg[@"local-ip"];
         if([local_ip_object isKindOfClass:[NSString class]])
         {
             NSString *line = (NSString *)local_ip_object;
             NSArray *inArr  = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" \n\r\t;,"]];
             NSMutableArray *arr = [[NSMutableArray alloc]init];
             for(NSString *s in inArr)
             {
                 NSString *ip = [UMSocket unifyIP:s];
                 [arr addObject:ip];
             }
             _configuredLocalAddresses = [arr copy];
         }
         else if([local_ip_object isKindOfClass:[UMSynchronizedArray class]])
         {
             UMSynchronizedArray *ua = (UMSynchronizedArray *)local_ip_object;
             NSMutableArray *arr = [[NSMutableArray alloc]init];
             for(NSString *s in ua)
             {
                 NSString *ip = [UMSocket unifyIP:s];
                 [arr addObject:ip];
             }
             _configuredLocalAddresses = [arr copy];

         }
         else if([local_ip_object isKindOfClass:[NSArray class]])
         {
             NSMutableArray *arr = [[NSMutableArray alloc]init];
             for(NSString *s in local_ip_object)
             {
                 NSString *ip = [UMSocket unifyIP:s];
                 [arr addObject:ip];
             }
             _configuredLocalAddresses = [arr copy];
         }
     }
     else
     {
         NSLog(@"Warning: no local-ip defined in %@",self.layerName);
     }

     if (cfg[@"local-port"])
     {
         _responderPort = [cfg[@"local-port"] intValue];
     }
     if (cfg[@"remote-ip"])
     {
         id remote_ip_object = cfg[@"remote-ip"];
         if([remote_ip_object isKindOfClass:[NSString class]])
         {
             NSString *line = (NSString *)remote_ip_object;
             NSArray *inArr  = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" \n\r\t;,"]];
             NSMutableArray *arr = [[NSMutableArray alloc]init];
             for(NSString *s in inArr)
             {
                 NSString *ip = [UMSocket unifyIP:s];
                 [arr addObject:ip];
             }
             _configuredRemoteAddresses = [arr copy];
         }
         else if([remote_ip_object isKindOfClass:[UMSynchronizedArray class]])
         {
             UMSynchronizedArray *ua = (UMSynchronizedArray *)remote_ip_object;
             NSMutableArray *arr = [[NSMutableArray alloc]init];
             for(NSString *s in ua)
             {
                 NSString *ip = [UMSocket unifyIP:s];
                 [arr addObject:ip];
             }
             _configuredRemoteAddresses = [arr copy];

         }
         else if([remote_ip_object isKindOfClass:[NSArray class]])
         {
             NSMutableArray *arr = [[NSMutableArray alloc]init];
             for(NSString *s in remote_ip_object)
             {
                 NSString *ip = [UMSocket unifyIP:s];
                 [arr addObject:ip];
             }
             _configuredRemoteAddresses = [arr copy];
         }
     }

     if (cfg[@"remote-port"])
     {
         _initiatorPort = [cfg[@"remote-port"] intValue];
     }
     if (cfg[@"heartbeat"])
     {
         _heartbeatSeconds = [cfg[@"heartbeat"] doubleValue];
     }
     if (cfg[@"mtu"])
     {
         _mtu = [cfg[@"mtu"] intValue];
     }

    if (cfg[@"reopen-timer1"])
    {
        _reopen_timer1_value = [cfg[@"reopen-timer1"] doubleValue];
    }
    if (cfg[@"reopen-timer2"])
    {
        _reopen_timer2_value = [cfg[@"reopen-timer2"] doubleValue];
    }
    if (cfg[@"watchdog-timer"])
    {
        _watchdog_timer_value = [cfg[@"watchdog-timer"] doubleValue];
    }
    if(_tcpPeer)
    {
        _initiator_socket = [[UMSocket alloc]initWithType:UMSOCKET_TYPE_TCP];
        _initiator_socket.customUser = self;
        if(_configuredLocalAddresses.count > 0)
        {
            UMHost *localHost = [[UMHost alloc]initWithAddress:_configuredLocalAddresses[0]];
            _initiator_socket.localHost = localHost;
            _responder_socket.localHost = localHost;
        }
        if(_configuredRemoteAddresses.count > 0)
        {
            UMHost *remoteHost = [[UMHost alloc]initWithAddress:_configuredRemoteAddresses[0]];
            _initiator_socket.remoteHost = remoteHost;
            _responder_socket.remoteHost = remoteHost;
        }
        _initiator_socket.requestedRemotePort = _initiatorPort;
        _responder_socket.requestedLocalPort = _responderPort;
    }
    else
    {
        UMSocketSCTP *is = [[UMSocketSCTP alloc]initWithType:UMSOCKET_TYPE_SCTP_STREAM ];
        is.requestedRemoteAddresses = _configuredRemoteAddresses;
        is.requestedLocalAddresses = _configuredLocalAddresses;
        is.requestedRemotePort = _initiatorPort;
        is.requestedLocalPort = 0;
        [is updateMtu:_mtu];
        [is switchToNonBlocking];
        [is setNoDelay];
        [is setInitParams];
        [is setIPDualStack];
        [is setLinger];
        [is setReuseAddr];
        [is setReusePort];
        [is enableEvents];
        UMSocketError err = [is bind];
        if(err!=UMSocketError_no_error)
        {
            [self logMajorError:[NSString stringWithFormat:@"can not bind initiator on %@: %d %@",_layerName,err,[UMSocket getSocketErrorString:err]]];
        }
        [is setHeartbeat:YES];
        _initiator_socket = is;
        _responder_socket = NULL; /* this one will be created by accept() */
    }
}



- (void)stopDetachAndDestroy
{
    RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventStopTask:),NULL);
}


- (void)powerOn
{
    RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT( @selector(_eventStartTask:), NULL);
}


- (void)powerOff
{
    RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT( @selector(_eventStopTask:), NULL);
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
    RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT( @selector(_eventSend_MessageTask:), packet);
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
    NSArray *addrs = _configuredLocalAddresses;
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

    if(resultCode != NULL)
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
    if(dcause != NULL)
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
    UMDiameterPacketDPA *packet = [[UMDiameterPacketDPA alloc]init];
    packet.hopByHopIdentifier = hopByHop;
    packet.endToEndIdentifier = endToEnd;

    /*
     <DPA>  ::= < Diameter Header: 282 >
       { Result-Code }
       { Origin-Host }
       { Origin-Realm }
       [ Error-Message ]
       [ Failed-AVP ]
     * [ AVP ]
     */
    // { Result-Code }
    if(resultCode!=NULL)
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

    if(resultCode!= NULL)
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
    NSArray *addrs = _configuredLocalAddresses;
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
    if([_supportedVendorIds count] > 0)
    {
        NSMutableArray<UMDiameterAvpSupported_Vendor_Id *>*arr =  [[NSMutableArray alloc]init];
        for(NSNumber *n in _supportedVendorIds)
        {
            UMDiameterAvpSupported_Vendor_Id *avp =  [[UMDiameterAvpSupported_Vendor_Id alloc]initWithObject:n];
            [arr addObject:avp];
        }
        packet.var_supported_vendor_id = arr;
    }
    if([_authApplicationIds count] > 0)
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

    // * [ Vendor-Specific-Application-Id ]
    NSArray<NSDictionary *>*vids = [_vendorSpecificIds copy];
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
    if(_router.firmwareRevision!= NULL)
    {
        packet.var_firmware_revision =  [[UMDiameterAvpFirmware_Revision alloc]initWithObject:_router.firmwareRevision];
    }
    return packet;
}

/***** ACTIONS *****/

/* Snd-Conn-Req: A transport connection is initiated with the peer. */
- (UMSocketError )actionI_Snd_Conn_Req:(UMDiameterPacket *)message
{
    UMSocketError err;
    if(_tcpPeer)
    {
        err = [_initiator_socket connect];
    }
    else
    {
        UMSocketSCTP *sctp = (UMSocketSCTP *)_initiator_socket;
        err = [sctp connectToAddresses:_configuredRemoteAddresses
                                  port:_initiatorPort
                                 assoc:&_i_assoc];
    }
    if((err==UMSocketError_no_error) || (err==UMSocketError_in_progress))
    {
        [_router startReceivingOnSocket:_initiator_socket forPeer:self];
    }
    return err;
}

/* Accept: The incoming connection associated with the R-Conn-CER is accepted as the responder connection.*/
- (void)actionR_Accept:(UMDiameterPacket *)message
{
    /* FIXME:  [_sctp_r accept:self]; */
}

/* Reject: The incoming connection associated with the R-Conn-CER is disconnected.*/
- (void)actionReject:(UMDiameterPacket *)message
{
    [_responder_socket close];
}

- (void)actionR_Reject:(UMDiameterPacket *)message
{
    [_responder_socket close];
}

/* Process-CER:  The CER associated with the R-Conn-CER is processed. */
- (void)actionProcess_CER:(UMDiameterPacket *)message
{
    UMDiameterPacketCER *cer = [[UMDiameterPacketCER alloc]initWithPacket:message];
    
    if(_logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:message.description];
    }

    _peer_vendor_id = cer.var_vendor_id;
    _peer_product_name = cer.var_product_name;
    _peer_supported_vendor_id = cer.var_supported_vendor_id;
    _peer_auth_application_id = cer.var_auth_application_id;
    _peer_inband_security_id = cer.var_inband_security_id;
    _peer_acct_application_id = cer.var_acct_application_id;
    _peer_vendor_specific_application_id = cer.var_vendor_specific_application_id;
    _peer_firmware_revision = cer.var_firmware_revision;
    
    NSMutableArray<NSNumber *> *c = [[NSMutableArray alloc]init];
    for(UMDiameterAvpSupported_Vendor_Id *a in _peer_supported_vendor_id)
    {
        for(NSNumber *b in _supportedVendorIds)
        {
            if([a.numberValue isEqualToNumber:b])
            {
                [c addObject:b];
                break;
            }
        }
    }
    _supportedVendorIds = c;
    
    c = [[NSMutableArray alloc]init];
    for(UMDiameterAvpAuth_Application_Id *a in _peer_auth_application_id)
    {
        for(NSNumber *b in _authApplicationIds)
        {
            if([a.numberValue isEqualToNumber:b])
            {
                [c addObject:b];
                break;
            }
        }
    }
    _authApplicationIds = c;
    
    
    c = [[NSMutableArray alloc]init];
    for(UMDiameterAvpAcct_Application_Id *a in _peer_acct_application_id)
    {
        for(NSNumber *b in _acctApplicationIds)
        {
            if([a.numberValue isEqualToNumber:b])
            {
                [c addObject:b];
                break;
            }
        }
    }
    _acctApplicationIds = c;
    
    
    NSMutableArray<NSDictionary *> *vids = [[NSMutableArray alloc]init];

    for(UMDiameterAvpVendor_Specific_Application_Id *a in _peer_vendor_specific_application_id)
    {
        for(NSDictionary *b in _vendorSpecificIds)
        {
            NSNumber *vendor = b[@"vendor"];
            NSNumber *app    = b[@"application"];
            NSNumber *acct   = b[@"acct"];

            if((a.var_vendor_id) && ([a.var_vendor_id.numberValue isEqualToNumber:vendor]))
            {
                BOOL match=YES;
                if(app!= NULL)
                {
                    if(  (a.var_auth_application_id==NULL) &&
                        !([a.var_auth_application_id.numberValue isEqualToNumber:app]))
                    {
                        match = NO;
                    }
                }
                if(acct!= NULL)
                {
                    if(  (a.var_acct_application_id==NULL) &&
                        !([a.var_acct_application_id.numberValue isEqualToNumber:acct]))
                    {
                        match = NO;
                    }
                }
                if(match)
                {
                    [vids addObject:b];
                }
            }
        }
    }
    _vendorSpecificIds = vids;
}

- (void)actionI_Snd_CER:(UMDiameterPacket *)message
{
    if(message==NULL)
    {
        message = [self createCER];
    }
    [self actionI_Snd_Message:message];
}


- (void)actionR_Snd_CER:(UMDiameterPacket *)message
{
    if(message==NULL)
    {
        message = [self createCER];
    }
    [self actionR_Snd_Message:message];
}


/* Snd-CEA        A CEA message is sent to the peer. */

- (void)actionR_Snd_CEA:(UMDiameterPacket *)message
{
    [self actionR_Snd_Message:message];
}


- (void)actionI_Snd_CEA:(UMDiameterPacket *)message
{
    [self actionI_Snd_Message:message];
}

/* Cleanup: If necessary, the connection is shut down, and any local resources are freed. */
- (void)actionCleanup:(UMDiameterPacket *)message
{
    /* FIXME: do something useful here */
}


/* Error: The transport layer connection is disconnected, either politely or abortively, in response to, an error condition.  Local resources are freed. */

- (void)actionError:(UMDiameterPacket *)message
{
    [_initiator_socket close];
    [_responder_socket close];
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
    [_initiator_socket close];
}

- (void)actionR_Disc:(UMDiameterPacket *)message
{
    [_responder_socket close];
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
        [_initiator_socket close];
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

- (UMSocketError)sendData:(NSData *)data socket:(UMSocket *)s
{
    if(_tcpPeer)
    {
        return [s sendData:data];
    }
    else
    {
        UMSocketSCTP *sctp = (UMSocketSCTP *)s;
        UMSocketError err = UMSocketError_no_error;
        uint32_t        *tmp_assocPtr;
        if(s == _initiator_socket )
        {
            tmp_assocPtr = &_i_assoc;
        }
        else
        {
            tmp_assocPtr = &_r_assoc;
        }
        /* ssize_t sent_packets = */ [sctp sendToAddresses:_configuredRemoteAddresses
                                                      port:s.connectedRemotePort
                                                     assoc:tmp_assocPtr
                                                      data:data
                                                    stream:0
                                                  protocol:DIAMETER_SCTP_PPID_CLEAR
                                                     error:&err];
        return err;
    }
}

- (void)actionI_Snd_Message:(UMDiameterPacket *)message
{
    [message beforeEncode];
    NSData *data = [message packedData];
    if(data==NULL)
    {
        [self logMajorError:[NSString stringWithFormat:@"actionI_Snd_Message: Can not encode packet %@",message]];
    }
    else
    {
        [self sendData:data socket:_initiator_socket];
    }
}

- (void)actionR_Snd_Message:(UMDiameterPacket *)message
{
    [message beforeEncode];
    NSData *data = [message packedData];
    if(data==NULL)
    {
        [self logMajorError:[NSString stringWithFormat:@"actionR_Snd_Message: Can not encode packet %@",message]];
    }
    else
    {
        [self sendData:data socket:_responder_socket];
    }
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
    [_router processIncomingPacket:message fromPeer:self
                             realm:message.destinationRealm.stringValue
                              host:message.destinationHost.stringValue];
}

- (void)housekeeping
{
    if(_outstandingWatchdogEvents > _maxOutstandingWatchdogEvents)
    {
        [self.logFeed majorErrorText:@"WATCHDOG-KILL"];
        [self actionError:NULL];
    }
}

- (NSString *)statusString
{
    NSMutableString *s = [[NSMutableString alloc]init];
    if(_tcpPeer)
    {
        [s appendString:@"tcp"];
    }
    else
    {
        [s appendString:@"sctp"];
    }
    NSString *loc = [_configuredLocalAddresses componentsJoinedByString:@","];
    NSString *rem = [_configuredRemoteAddresses componentsJoinedByString:@","];
    [s appendFormat:@":(%@:%d<->%@:%d)",loc,_responderPort,rem,_initiatorPort];
    UMSocketStatus status;
    if(_isIncoming)
    {
        [s appendString:@":responder"];
        status = _responder_socket.status;
    }
    else
    {
        [s appendString:@":initiator"];
        status = _initiator_socket.status;
    }
    [s appendString:@":"];
    [s appendString:[UMSocket statusDescription:status]];
    NSMutableArray *attributes = [[NSMutableArray alloc]init];
    if(_isIncoming)
    {
        [attributes addObject:@"incoming"];
    }
    if(_isConnecting)
    {
        [attributes addObject:@"connecting"];
    }
    if(_isConnected)
    {
        [attributes addObject:@"connected"];
    }
    if(_isActive)
    {
        [attributes addObject:@"active"];
    }
    if(_isForcedOutOfService)
    {
        [attributes addObject:@"forced-out-of-service"];
    }
    NSString *attributesString = [attributes componentsJoinedByString:@","];
    [s appendFormat:@"\n    Attributes: %@\n    State: %@",attributesString,_peerState.currentState];
    return s;
}

- (UMSocketError)handlePollResult:(int)revent
                           socket:(UMSocket *)socket
                        poll_time:(UMMicroSec)poll_time
                        initiator:(BOOL)initiator
{
    UMSocketError returnValue = UMSocketError_no_error;
    if(revent & (POLLIN | POLLPRI))
    {
        /* Data other than high priority data may be read without blocking. */
        returnValue = [self receiveData:initiator];
        if(returnValue == UMSocketError_has_data_and_hup)
        {
            [self connectionDisconnectedForSocket:socket];
            [socket close];
            return returnValue;
        }
    }
    if(revent & POLLERR)
    {
        /* An exceptional condition has occurred on the device or socket */
        [self connectionErrorForSocket:socket];
        [socket close];
    }
    else if(revent & POLLHUP)
    {
        /* The device or socket has been disconnected. */
        [self connectionDisconnectedForSocket:socket];
        [socket close];
    }
    if(revent & POLLNVAL)
    {
        /* POLLNVAL The file descriptor is not open */
        [self connectionDisconnectedForSocket:socket];
        [socket close];
    }
    return returnValue;
}

- (UMSocketError )receiveData:(BOOL)initiator
{
    NSData *input;
    UMSocketError e;

    UMSocket *socket;
    if(initiator)
    {
        socket = _initiator_socket;
    }
    else
    {
        socket = _responder_socket;
    }
    if(_tcpPeer)
    {
        e = [socket receiveEverythingTo:&input];

        if((e == UMSocketError_has_data) || (e == UMSocketError_has_data_and_hup))
        {
            [_dataBuffersLock lock];
            if(initiator)
            {
                if(_initiator_receive_buffer ==NULL)
                {
                    _initiator_receive_buffer = [[NSMutableData alloc]initWithData:input];
                }
                else
                {
                    [_initiator_receive_buffer appendData:input];
                }
            }
            else
            {
                if(_responder_receive_buffer ==NULL)
                {
                    _responder_receive_buffer = [[NSMutableData alloc]initWithData:input];
                }
                else
                {
                    [_responder_receive_buffer appendData:input];
                }
            }

            [_dataBuffersLock unlock];
            if(e == UMSocketError_has_data)
            {
                e = UMSocketError_no_error;
            }
        }
        [self checkForPackets:initiator];
        if(e==UMSocketError_not_connected)
        {
            [self connectionDownForSocket:_responder_socket];
        }
    }
    else
    {
        UMSocketSCTP *sctp = (UMSocketSCTP *)socket;
        UMSocketSCTPReceivedPacket *rx = [sctp receiveSCTP];
        e = rx.err;
        if(e == UMSocketError_no_error)
        {
            if(rx.isNotification)
            {
                [self handleEvent:rx.data
                         streamId:rx.streamId
                       protocolId:rx.protocolId
                        initiator:initiator];
            }
            else
            {
                [self handleData:rx.data
                         streamId:rx.streamId
                       protocolId:rx.protocolId
                        initiator:initiator];
            }
        }
    }
    return e;
}

- (void)checkForPackets:(BOOL)initiator
{
    [_dataBuffersLock lock];
    NSInteger pos=0;
    UMDiameterPacket *packet;
    NSMutableData *buffer;
    if(initiator)
    {
        buffer = _initiator_receive_buffer;
    }
    else
    {
        buffer = _responder_receive_buffer;
    }

    packet = [[UMDiameterPacket alloc]initWithData:buffer atPosition:&pos];
    if(packet)
    {
        [buffer replaceBytesInRange:NSMakeRange(0,pos) withBytes:"" length:0];
        [self handlePacket:packet initiator:initiator];
    }
    [_dataBuffersLock unlock];
}



/* EVENT HANDLERS */


-(void) handleEvent:(NSData *)event
           streamId:(uint32_t)streamId
         protocolId:(uint16_t)protocolId
          initiator:(BOOL)initiator
{

    const union sctp_notification *snp;
    snp = event.bytes;
    switch(snp->sn_header.sn_type)
    {
        case SCTP_ASSOC_CHANGE:
            [self handleAssocChange:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
        case SCTP_PEER_ADDR_CHANGE:
            [self handlePeerAddrChange:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
        case SCTP_SEND_FAILED:
            [self handleSendFailed:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
        case SCTP_REMOTE_ERROR:
            [self handleRemoteError:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
        case SCTP_SHUTDOWN_EVENT:
            [self handleShutdownEvent:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
        case SCTP_PARTIAL_DELIVERY_EVENT:
            [self handleAdaptionIndication:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
        case SCTP_ADAPTATION_INDICATION:
            [self handleAdaptionIndication:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
#if defined SCTP_AUTHENTICATION_EVENT
        case SCTP_AUTHENTICATION_EVENT:
            [self handleAuthenticationEvent:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
#endif
        case SCTP_SENDER_DRY_EVENT:
            [self handleSenderDryEvent:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;

#if defined SCTP_STREAM_RESET_EVENT
        case  SCTP_STREAM_RESET_EVENT:
            [self handleStreamResetEvent:event streamId:streamId protocolId:protocolId initiator:initiator];
            break;
#endif

        default:
            [self.logFeed majorErrorText:[NSString stringWithFormat:@"SCTP unknown event type: %hu", snp->sn_header.sn_type]];
            [self.logFeed majorErrorText:[NSString stringWithFormat:@" RX-STREAM: %d",streamId]];
            [self.logFeed majorErrorText:[NSString stringWithFormat:@" RX-PROTO: %d", protocolId]];
            [self.logFeed majorErrorText:[NSString stringWithFormat:@" RX-DATA: %@",event.description]];
    }
}

- (void)handlePacket:(UMDiameterPacket *)packet
           initiator:(BOOL) initiator
{
    if((packet.commandCode == UMDiameterCommandCode_Capabilities_Exchange) &&
       (packet.applicationId == UMDiameterApplicationId_Diameter_Common_Messages))
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
    }
    else
    {
        if(initiator)
        {
            _peerState = [_peerState eventI_Rcv_Non_CEA:self message:packet];
        }
        else
        {
            _peerState = [_peerState eventR_Rcv_Non_CEA:self message:packet];
        }
    }

    if((packet.commandCode == UMDiameterCommandCode_Disconnect_Peer) &&
       (packet.applicationId == UMDiameterApplicationId_Diameter_Common_Messages))
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
    }
    else if((packet.commandCode == UMDiameterCommandCode_Device_Watchdog) &&
            (packet.applicationId == UMDiameterApplicationId_Diameter_Common_Messages))
    {
        if(packet.flagRequest)
        {
            if(initiator)
            {
                _peerState = [_peerState eventI_Rcv_DWR:self message:packet];
            }
            else
            {
                _peerState = [_peerState eventR_Rcv_DWR:self message:packet];
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
    }
    else
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


- (void)connectionUpForSocket:(UMSocket *)sock
{
    if(sock == _initiator_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventI_Rcv_Conn_Ack:self message:NULL];
        [_eventLock unlock];
    }
    else if (sock == _responder_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventR_Rcv_Conn_Ack:self message:NULL];
        [_eventLock unlock];
    }
}

- (void)connectionDownForSocket:(UMSocket *)sock
{
    if(sock == _initiator_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventI_Rcv_Conn_Nack:self message:NULL];
        [_eventLock unlock];


    }
    else if (sock == _responder_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventR_Rcv_Conn_Nack:self message:NULL];
        [_eventLock unlock];
    }
}


- (void)connectionFailedForSocket:(UMSocket *)sock
{
    if(sock == _initiator_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventI_Rcv_Conn_Nack:self message:NULL];
        [_eventLock unlock];


    }
    else if (sock == _responder_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventR_Rcv_Conn_Nack:self message:NULL];
        [_eventLock unlock];
    }
}

- (void)connectionErrorForSocket:(UMSocket *)sock
{
    if(sock == _initiator_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventI_Rcv_Conn_Nack:self message:NULL];
        [_eventLock unlock];


    }
    else if (sock == _responder_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventR_Rcv_Conn_Nack:self message:NULL];
        [_eventLock unlock];
    }
}

- (void)connectionDisconnectedForSocket:(UMSocket *)sock
{
    if(sock == _initiator_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventI_Peer_Disc:self message:NULL];
        [_eventLock unlock];


    }
    else if (sock == _responder_socket)
    {
        [_eventLock lock];
        _peerState = [_peerState eventR_Peer_Disc:self message:NULL];
        [_eventLock unlock];
    }
}


-(void) handleAssocChange:(NSData *)event
                 streamId:(uint32_t)streamId
               protocolId:(uint16_t)protocolId
                initiator:(BOOL)initiator
{
    const union sctp_notification *snp;
    snp = event.bytes;
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_ASSOC_CHANGE"];
    }
#endif
    if(len < sizeof (struct sctp_assoc_change))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_ASSOC_CHANGE"];
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSString *state = @"(UNKNOWN)";
        switch(snp->sn_assoc_change.sac_state)
        {
            case SCTP_COMM_UP:
                state =@"SCTP_COMM_UP";
                break;
            case SCTP_COMM_LOST:
                state =@"SCTP_COMM_LOST";
                break;
            case SCTP_RESTART:
                state =@"SCTP_RESTART";
                break;
            case SCTP_SHUTDOWN_COMP:
                state =@"SCTP_SHUTDOWN_COMP";
                break;
            case SCTP_CANT_STR_ASSOC:
                state =@"SCTP_CANT_STR_ASSOC";
                break;
        }


        [self logDebug:[NSString stringWithFormat:@"  sac_type: %d",             (int)snp->sn_assoc_change.sac_type]];
        [self logDebug:[NSString stringWithFormat:@"  sac_flags: %d",            (int)snp->sn_assoc_change.sac_flags]];
        [self logDebug:[NSString stringWithFormat:@"  sac_length: %d",           (int)snp->sn_assoc_change.sac_length]];
        [self logDebug:[NSString stringWithFormat:@"  sac_state: %d %@",            (int)snp->sn_assoc_change.sac_state, state]];
        [self logDebug:[NSString stringWithFormat:@"  sac_error: %d",            (int)snp->sn_assoc_change.sac_error]];
        [self logDebug:[NSString stringWithFormat:@"  sac_outbound_streams: %d", (int)snp->sn_assoc_change.sac_outbound_streams]];
        [self logDebug:[NSString stringWithFormat:@"  sac_inbound_streams: %d",  (int)snp->sn_assoc_change.sac_inbound_streams]];
        [self logDebug:[NSString stringWithFormat:@"  sac_assoc_id: %d",         (int)snp->sn_assoc_change.sac_assoc_id]];
    }
#endif
    if((snp->sn_assoc_change.sac_state==SCTP_COMM_UP) && (snp->sn_assoc_change.sac_error== 0))
    {
        if(initiator)
        {
            _i_assoc = snp->sn_assoc_change.sac_assoc_id;
            [self.logFeed infoText:[NSString stringWithFormat:@"DiameterPeer %@ Initiator SCTP_ASSOC_CHANGE: SCTP_COMM_UP(assocID=%ld)",_layerName,(long)snp->sn_assoc_change.sac_assoc_id]];
            [self connectionUpForSocket:_initiator_socket];

        }
        else
        {
            _r_assoc = snp->sn_assoc_change.sac_assoc_id;
            [self.logFeed infoText:[NSString stringWithFormat:@"DiameterPeer %@ Responder SCTP_ASSOC_CHANGE: SCTP_COMM_UP(assocID=%ld)",_layerName,(long)snp->sn_assoc_change.sac_assoc_id]];
            [self connectionUpForSocket:_responder_socket];
        }
    }
    else if(snp->sn_assoc_change.sac_state==SCTP_COMM_LOST)
    {
        if(initiator)
        {
            _i_assoc = snp->sn_assoc_change.sac_assoc_id;
            [self.logFeed infoText:[NSString stringWithFormat:@"DiameterPeer %@ Initiator SCTP_ASSOC_CHANGE: SCTP_COMM_LOST(assocID=%ld)",_layerName,(long)snp->sn_assoc_change.sac_assoc_id]];
            [self connectionDownForSocket:_initiator_socket];

        }
        else
        {
            _r_assoc = snp->sn_assoc_change.sac_assoc_id;
            [self.logFeed infoText:[NSString stringWithFormat:@"DiameterPeer %@ Responder SCTP_ASSOC_CHANGE: SCTP_COMM_LOST(assocID=%ld)",_layerName,(long)snp->sn_assoc_change.sac_assoc_id]];
            [self connectionDownForSocket:_responder_socket];
        }
    }
    else if(snp->sn_assoc_change.sac_state==SCTP_CANT_STR_ASSOC)
    {
        if(initiator)
        {
            [self.logFeed infoText:[NSString stringWithFormat:@"DiameterPeer %@ Initiator SCTP_ASSOC_CHANGE: SCTP_CANT_STR_ASSOC",_layerName]];
            [self connectionFailedForSocket:_initiator_socket];
        }
        else
        {
            [self.logFeed infoText:[NSString stringWithFormat:@"DiameterPeer %@ Responder SCTP_ASSOC_CHANGE: SCTP_CANT_STR_ASSOC",_layerName]];
            [self connectionFailedForSocket:_responder_socket];
        }

    }
    else if(snp->sn_assoc_change.sac_error!=0)
    {
        if(initiator)
        {
            [self.logFeed infoText:[NSString stringWithFormat:@"DiameterPeer %@ Initiator SCTP_ASSOC_CHANGE: SCTP_COMM_ERROR",_layerName]];
            [self connectionErrorForSocket:_initiator_socket];
        }
        else
        {
            [self.logFeed infoText:[NSString stringWithFormat:@"DiameterPeer %@ Responder SCTP_ASSOC_CHANGE: SCTP_COMM_ERROR",_layerName]];
            [self connectionErrorForSocket:_responder_socket];
        }
    }
}


-(void) handlePeerAddrChange:(NSData *)event
                    streamId:(uint32_t)streamId
                  protocolId:(uint16_t)protocolId
                   initiator:(BOOL)initiator
{
    const union sctp_notification *snp;

    char addrbuf[INET6_ADDRSTRLEN];
    const char *ap;
    struct sockaddr_in *sin;
    struct sockaddr_in6 *sin6;

    snp = event.bytes;
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_PEER_ADDR_CHANGE"];
    }
#endif
    if(len < sizeof (struct sctp_paddr_change))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_PEER_ADDR_CHANGE"];
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  spc_type: %d",    (int)snp->sn_paddr_change.spc_type]];
        [self logDebug:[NSString stringWithFormat:@"  spc_flags: %d",   (int)snp->sn_paddr_change.spc_flags]];
        [self logDebug:[NSString stringWithFormat:@"  spc_length: %d",  (int)snp->sn_paddr_change.spc_length]];
    }
#endif
    if (snp->sn_paddr_change.spc_aaddr.ss_family == AF_INET)
    {
        //struct sockaddr_in *sin;
        sin = (struct sockaddr_in *)&snp->sn_paddr_change.spc_aaddr;
        ap = inet_ntop(AF_INET, &sin->sin_addr, addrbuf, INET6_ADDRSTRLEN);
        if(self.logLevel <= UMLOG_DEBUG)
        {
            [self logDebug:[NSString stringWithFormat:@"  spc_aaddr: ipv4:%s", ap]];
        }
    }
    else
    {
        sin6 = (struct sockaddr_in6 *)&snp->sn_paddr_change.spc_aaddr;
        ap = inet_ntop(AF_INET6, &sin6->sin6_addr, addrbuf, INET6_ADDRSTRLEN);
        if(self.logLevel <= UMLOG_DEBUG)
        {
            [self logDebug:[NSString stringWithFormat:@"  spc_aaddr: ipv6:%s", ap]];
        }
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  spc_state: %d",   (int)snp->sn_paddr_change.spc_state]];
        [self logDebug:[NSString stringWithFormat:@"  spc_error: %d",   (int)snp->sn_paddr_change.spc_error]];
        if (snp->sn_paddr_change.spc_aaddr.ss_family == AF_INET)
        {
            [self logDebug:[NSString stringWithFormat:@" SCTP_PEER_ADDR_CHANGE: ipv4:%s",ap]];
        }
        else
        {
            [self logDebug:[NSString stringWithFormat:@" SCTP_PEER_ADDR_CHANGE: ipv6:%s",ap]];
        }
    }
#endif
}

-(void) handleRemoteError:(NSData *)event
                 streamId:(uint32_t)streamId
               protocolId:(uint16_t)protocolId
                initiator:(BOOL)initiator
{
#if defined(ULIBSCTP_CONFIG_DEBUG)
    const union sctp_notification *snp;
    snp = event.bytes;
#endif
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_REMOTE_ERROR"];
    }
#endif
    if(len < sizeof (struct sctp_remote_error))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_REMOTE_ERROR"];
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)

    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  sre_type: %d",             (int)snp->sn_remote_error.sre_type]];
        [self logDebug:[NSString stringWithFormat:@"  sre_flags: %d",            (int)snp->sn_remote_error.sre_flags]];
        [self logDebug:[NSString stringWithFormat:@"  sre_length: %d",           (int)snp->sn_remote_error.sre_length]];
        [self logDebug:[NSString stringWithFormat:@"  sre_length: %d",           (int)snp->sn_remote_error.sre_error]];
        [self logDebug:[NSString stringWithFormat:@"  sre_assoc_id: %d",         (int)snp->sn_remote_error.sre_assoc_id]];
        [self logDebug:[NSString stringWithFormat:@"  sre_data: %02X %02X %02X %02x",
                        (int)snp->sn_remote_error.sre_data[0],
                        (int)snp->sn_remote_error.sre_data[1],
                        (int)snp->sn_remote_error.sre_data[2],
                        (int)snp->sn_remote_error.sre_data[3]]];
    }
#endif
}


-(int) handleSendFailed:(NSData *)event
               streamId:(uint32_t)streamId
             protocolId:(uint16_t)protocolId
              initiator:(BOOL)initiator
{
    const union sctp_notification *snp;
    snp = event.bytes;
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_SEND_FAILED"];
    }
#endif
    if(len < sizeof (struct sctp_send_failed))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_SEND_FAILED"];
        return UMSocketError_not_supported_operation;
    }
    [self.logFeed majorErrorText:@"SCTP_SEND_FAILED"];
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  ssf_type: %d",                (int)snp->sn_send_failed.ssf_type]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_flags: %d",               (int)snp->sn_send_failed.ssf_flags]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_length: %d",              (int)snp->sn_send_failed.ssf_length]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_error: %d",               (int)snp->sn_send_failed.ssf_error]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_assoc_id: %d",            (int)snp->sn_send_failed.ssf_assoc_id]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_stream: %d",   (int)snp->sn_send_failed.ssf_info.sinfo_stream]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_ssn: %d",      (int)snp->sn_send_failed.ssf_info.sinfo_ssn]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_flags: %d",    (int)snp->sn_send_failed.ssf_info.sinfo_flags]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_stream: %d",   (int)snp->sn_send_failed.ssf_info.sinfo_stream]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_context: %d",  (int)snp->sn_send_failed.ssf_info.sinfo_context]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_timetolive: %d",(int)snp->sn_send_failed.ssf_info.sinfo_timetolive]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_tsn: %d",      (int)snp->sn_send_failed.ssf_info.sinfo_tsn]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_cumtsn: %d",   (int)snp->sn_send_failed.ssf_info.sinfo_cumtsn]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_info.sinfo_assoc_id: %d", (int)snp->sn_send_failed.ssf_info.sinfo_assoc_id]];
        [self logDebug:[NSString stringWithFormat:@"  ssf_assoc_id: %d",    (int)snp->sn_send_failed.ssf_assoc_id]];
    }
#endif
    [self.logFeed majorErrorText:[NSString stringWithFormat:@"SCTP sendfailed: len=%u err=%d\n", snp->sn_send_failed.ssf_length,snp->sn_send_failed.ssf_error]];
    if(initiator)
    {
        [self connectionErrorForSocket:_initiator_socket];
    }
    else
    {
        [self connectionErrorForSocket:_responder_socket];
    }
    return -1;
}


-(int) handleShutdownEvent:(NSData *)event
                  streamId:(uint32_t)streamId
                protocolId:(uint16_t)protocolId
                 initiator:(BOOL)initiator
{
#if defined(ULIBSCTP_CONFIG_DEBUG)
    const union sctp_notification *snp;
    snp = event.bytes;
#endif
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_SHUTDOWN_EVENT"];
    }
#endif
    if(len < sizeof (struct sctp_shutdown_event))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_SHUTDOWN_EVENT"];
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  sse_type: %d",     (int)snp->sn_shutdown_event.sse_type]];
        [self logDebug:[NSString stringWithFormat:@"  sse_flags: %d",    (int)snp->sn_shutdown_event.sse_flags]];
        [self logDebug:[NSString stringWithFormat:@"  sse_length: %d",   (int)snp->sn_shutdown_event.sse_length]];
        [self logDebug:[NSString stringWithFormat:@"  sse_assoc_id: %d", (int)snp->sn_shutdown_event.sse_assoc_id]];
    }
#endif
    [self.logFeed warningText:@"SCTP_SHUTDOWN_EVENT->POWERDOWN"];
    if(initiator)
    {
        [self connectionDownForSocket:_initiator_socket];
    }
    else
    {
        [self connectionDownForSocket:_responder_socket];
    }
    return -1;
}


-(int) handleAdaptionIndication:(NSData *)event
                       streamId:(uint32_t)streamId
                     protocolId:(uint16_t)protocolId
                      initiator:(BOOL)initiator
{
#if defined(ULIBSCTP_CONFIG_DEBUG)
    const union sctp_notification *snp;
    snp = event.bytes;
#endif
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_ADAPTATION_INDICATION"];
    }
#endif
    if(len < sizeof(struct sctp_adaptation_event))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_ADAPTATION_INDICATION"];
        return UMSocketError_not_supported_operation;
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  sai_type: %d",           (int)snp->sn_adaptation_event.sai_type]];
        [self logDebug:[NSString stringWithFormat:@"  sai_flags: %d",          (int)snp->sn_adaptation_event.sai_flags]];
        [self logDebug:[NSString stringWithFormat:@"  sai_length: %d",         (int)snp->sn_adaptation_event.sai_length]];
        [self logDebug:[NSString stringWithFormat:@"  sai_adaptation_ind: %d", (int)snp->sn_adaptation_event.sai_adaptation_ind]];
        [self logDebug:[NSString stringWithFormat:@"  sai_assoc_id: %d",       (int)snp->sn_adaptation_event.sai_assoc_id]];
    }
#endif
    return 0;
}

-(int) handlePartialDeliveryEvent:(NSData *)event
                         streamId:(uint32_t)streamId
                       protocolId:(uint16_t)protocolId
                        initiator:(BOOL)initiator
{
#if defined(ULIBSCTP_CONFIG_DEBUG)
    const union sctp_notification *snp;
    snp = event.bytes;
#endif
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_PARTIAL_DELIVERY_EVENT"];
    }
#endif
    if(len < sizeof(struct sctp_pdapi_event))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_PARTIAL_DELIVERY_EVENT"];
        return UMSocketError_not_supported_operation;
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  pdapi_type: %d",           (int)snp->sn_pdapi_event.pdapi_type]];
        [self logDebug:[NSString stringWithFormat:@"  pdapi_flags: %d",          (int)snp->sn_pdapi_event.pdapi_flags]];
        [self logDebug:[NSString stringWithFormat:@"  pdapi_length: %d",         (int)snp->sn_pdapi_event.pdapi_length]];
        [self logDebug:[NSString stringWithFormat:@"  pdapi_indication: %d",     (int)snp->sn_pdapi_event.pdapi_indication]];
#ifndef LINUX
        [self logDebug:[NSString stringWithFormat:@"  pdapi_stream: %d",         (int)snp->sn_pdapi_event.pdapi_stream]];
        [self logDebug:[NSString stringWithFormat:@"  pdapi_seq: %d",            (int)snp->sn_pdapi_event.pdapi_seq]];
#endif
        [self logDebug:[NSString stringWithFormat:@"  pdapi_assoc_id: %d",       (int)snp->sn_pdapi_event.pdapi_assoc_id]];
    }
#endif
    return UMSocketError_no_error;
}

-(int) handleAuthenticationEvent:(NSData *)event
                        streamId:(uint32_t)streamId
                      protocolId:(uint16_t)protocolId
                       initiator:(BOOL)initiator
{
#if defined(ULIBSCTP_CONFIG_DEBUG)
    const union sctp_notification *snp;
    snp = event.bytes;
#endif
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_AUTHENTICATION_EVENT"];
    }
#endif
    if(len < sizeof(struct sctp_authkey_event))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_AUTHENTICATION_EVENT"];
        return UMSocketError_not_supported_operation;
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
#if defined(LINUX)
        [self logDebug:[NSString stringWithFormat:@"  auth_type: %d",           (int)snp->sn_authkey_event.auth_type]];
        [self logDebug:[NSString stringWithFormat:@"  auth_flags: %d",          (int)snp->sn_authkey_event.auth_flags]];
        [self logDebug:[NSString stringWithFormat:@"  auth_length: %d",         (int)snp->sn_authkey_event.auth_length]];
        [self logDebug:[NSString stringWithFormat:@"  auth_keynumber: %d",      (int)snp->sn_authkey_event.auth_keynumber]];
        [self logDebug:[NSString stringWithFormat:@"  auth_altkeynumber: %d",   (int)snp->sn_authkey_event.auth_altkeynumber]];
        [self logDebug:[NSString stringWithFormat:@"  auth_indication: %d",     (int)snp->sn_authkey_event.auth_indication]];
        [self logDebug:[NSString stringWithFormat:@"  auth_assoc_id: %d",       (int)snp->sn_authkey_event.auth_assoc_id]];

#else
        [self logDebug:[NSString stringWithFormat:@"  auth_type: %d",           (int)snp->sn_auth_event.auth_type]];
        [self logDebug:[NSString stringWithFormat:@"  auth_flags: %d",          (int)snp->sn_auth_event.auth_flags]];
        [self logDebug:[NSString stringWithFormat:@"  auth_length: %d",         (int)snp->sn_auth_event.auth_length]];
        [self logDebug:[NSString stringWithFormat:@"  auth_keynumber: %d",      (int)snp->sn_auth_event.auth_keynumber]];
        [self logDebug:[NSString stringWithFormat:@"  auth_altkeynumber: %d",   (int)snp->sn_auth_event.auth_altkeynumber]];
        [self logDebug:[NSString stringWithFormat:@"  auth_indication: %d",     (int)snp->sn_auth_event.auth_indication]];
        [self logDebug:[NSString stringWithFormat:@"  auth_assoc_id: %d",       (int)snp->sn_auth_event.auth_assoc_id]];
#endif
    }
#endif
    return UMSocketError_no_error;
}

#if defined(SCTP_STREAM_RESET_EVENT)
-(int) handleStreamResetEvent:(NSData *)event
                     streamId:(uint32_t)streamId
                   protocolId:(uint16_t)protocolId
                    initiator:(BOOL)initiator
{
#if defined(ULIBSCTP_CONFIG_DEBUG)
    const union sctp_notification *snp;
    snp = event.bytes;
#endif
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_STREAM_RESET_EVENT"];
    }
#endif
    if(len < sizeof(struct sctp_stream_reset_event))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_STREAM_RESET_EVENT"];
        return UMSocketError_not_supported_operation;
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  strreset_type: %d",     (int)snp->sn_strreset_event.strreset_type]];
        [self logDebug:[NSString stringWithFormat:@"  strreset_flags: %d",    (int)snp->sn_strreset_event.strreset_flags]];
        [self logDebug:[NSString stringWithFormat:@"  strreset_length: %d",   (int)snp->sn_strreset_event.strreset_length]];
        [self logDebug:[NSString stringWithFormat:@"  strreset_assoc_id: %d", (int)snp->sn_strreset_event.strreset_assoc_id]];
    }
#endif
    return UMSocketError_no_error;
}
#endif

-(int) handleSenderDryEvent:(NSData *)event
                   streamId:(uint32_t)streamId
                 protocolId:(uint16_t)protocolId
                  initiator:(BOOL)initiator
{
#if defined(ULIBSCTP_CONFIG_DEBUG)
    const union sctp_notification *snp;
    snp = event.bytes;
#endif
    NSUInteger len = event.length;

#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:@"SCTP_SENDER_DRY_EVENT"];
    }
#endif
    if(len < sizeof(struct sctp_sender_dry_event))
    {
        [self.logFeed majorErrorText:@" Size Mismatch in SCTP_SENDER_DRY_EVENT"];
        return UMSocketError_not_supported_operation;
    }
#if defined(ULIBSCTP_CONFIG_DEBUG)
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self logDebug:[NSString stringWithFormat:@"  sender_dry_type: %d",     (int)snp->sn_sender_dry_event.sender_dry_type]];
        [self logDebug:[NSString stringWithFormat:@"  sender_dry_flags: %d",    (int)snp->sn_sender_dry_event.sender_dry_flags]];
        [self logDebug:[NSString stringWithFormat:@"  sender_dry_length: %d",   (int)snp->sn_sender_dry_event.sender_dry_length]];
        [self logDebug:[NSString stringWithFormat:@"  sender_dry_assoc_id: %d", (int)snp->sn_sender_dry_event.sender_dry_assoc_id]];
    }
#endif
    return UMSocketError_no_error;
}


- (void) handleData:(NSData *)data
           streamId:(uint32_t)streamId
         protocolId:(uint16_t)protocolId
          initiator:(BOOL)initiator
{
    if(data.length == 0)
    {
        return;
    }
    UMDiameterPacket *packet = [[UMDiameterPacket alloc]initWithData:data];
     if(!packet)
     {
         NSString *s = [NSString stringWithFormat:@"can not decode SCTP packet\n\tstream:%d\n\tprotocol:%d\n\tpacket: %@",(int)streamId, (int)protocolId, [data hexString]];
         [self.logFeed majorErrorText:s];
         [self actionError:NULL];
     }
     else if((protocolId!=0) && (protocolId!=DIAMETER_SCTP_PPID_CLEAR))
     {
         NSString *s = [NSString stringWithFormat:@"Unsupported protocol ID for Diameter. PID=%d", (int)protocolId];
         [self.logFeed majorError:0 withText:s];
         [self actionError:NULL];
     }
    else
    {
        [self processPacket:packet initiator:initiator];
    }
}

- (void) processPacket:(UMDiameterPacket *)packet
             initiator:(BOOL)initiator
{
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
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_CERTask:),packet);
                         }
                         else
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_CERTask:),packet);
                         }
                         break;
                     }
                     case UMDiameterCommandCode_Disconnect_Peer:
                     {
                         if(initiator)
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_DPRTask:),packet);
                         }
                         else
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_DPRTask:),packet);
                         }
                         break;
                     }
                     case UMDiameterCommandCode_Device_Watchdog:
                     {
                         if(initiator)
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_DWRTask:),packet);

                         }
                         else
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_DWRTask:),packet);

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
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_CEATask:),packet);
                         }
                         else
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_CEATask:),packet);
                         }
                         break;
                     }
                     case UMDiameterCommandCode_Disconnect_Peer:
                     {
                         if(initiator)
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_DPATask:),packet);
                         }
                         else
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_DPATask:),packet);
                                             }
                         break;
                     }
                     case UMDiameterCommandCode_Device_Watchdog:
                     {
                         if(initiator)
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_DWATask:),packet);
                         }
                         else
                         {
                             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_DWATask:),packet);
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
                 break;
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
             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_MessageTask:),packet);
         }
         else
         {
             RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_MessageTask:),packet);
         }
     }
 }


- (UMSynchronizedSortedDictionary *)diameterStatus
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    dict[@"protocol"] = _tcpPeer ? @"tcp" :  @"sctp";
    dict[@"remote-ip"] = [_configuredRemoteAddresses componentsJoinedByString:@", "];
    dict[@"local-ip"] = [_configuredLocalAddresses componentsJoinedByString:@", "];
    dict[@"remote-port"] = @(_initiatorPort);
    dict[@"local-port"] = @(_responderPort);
    if(!_tcpPeer)
    {
        if(_initiator_socket)
        {
            dict[@"initiator-sctp-socket-status"] = [UMSocket statusDescription:_initiator_socket.status];
        }
        if(_responder_socket)
        {
            dict[@"responder-sctp-socket-status"] = [UMSocket statusDescription:_responder_socket.status];
        }
    }
    dict[@"peer-state"] = _peerState.currentState;
    dict[@"watchdog-last-request-sent"]     =  _lastWatchdogRequestSent     ? _lastWatchdogRequestSent      : @"never";
    dict[@"watchdog-last-answer-received"]  =  _lastWatchdogAnswerReceived  ? _lastWatchdogAnswerReceived   : @"never";
    dict[@"watchdog-last-request-received"] =  _lastWatchdogRequestReceived ? _lastWatchdogRequestReceived  : @"never";
    dict[@"watchdog-last-answer-sent"]      =  _lastWatchdogAnswerSent      ? _lastWatchdogAnswerSent       : @"never";
    
    if(_peer_vendor_id)
    {
        dict[@"peer-vendor-id"] = _peer_vendor_id.objectValue;
    }
    if(_peer_product_name)
    {
        dict[@"peer-product-name"] = _peer_product_name.objectValue;
    }
    if(_peer_supported_vendor_id)
    {
        NSMutableArray *a = [[NSMutableArray alloc]init];
        for(UMDiameterAvpSupported_Vendor_Id *avp in _peer_supported_vendor_id)
        {
            [a addObject:avp.objectValue];
        }
        dict[@"peer-suppored-vendor-id"] = a;
    }
    
    if(_peer_auth_application_id)
    {
        NSMutableArray *a = [[NSMutableArray alloc]init];
        for(UMDiameterAvpAuth_Application_Id *avp in _peer_auth_application_id)
        {
            [a addObject:avp.objectValue];
        }
        dict[@"peer-auth-application-id"] = a;
    }
    if(_peer_auth_application_id)
    {
        NSMutableArray *a = [[NSMutableArray alloc]init];
        for(UMDiameterAvpAuth_Application_Id *avp in _peer_auth_application_id)
        {
            [a addObject:avp.objectValue];
        }
        dict[@"peer-auth-application-id"] = a;
    }
    if(_peer_inband_security_id)
    {
        NSMutableArray *a = [[NSMutableArray alloc]init];
        for(UMDiameterAvpInband_Security_Id *avp in _peer_inband_security_id)
        {
            [a addObject:avp.objectValue];
        }
        dict[@"peer-inband-security-id"] = a;
    }
    
    if(_peer_acct_application_id)
    {
        NSMutableArray *a = [[NSMutableArray alloc]init];
        for(UMDiameterAvpAcct_Application_Id *avp in _peer_acct_application_id)
        {
            [a addObject:avp.objectValue];
        }
        dict[@"peer-acct-application-id"] = a;
    }
    if(_peer_vendor_specific_application_id)
    {
        UMSynchronizedArray *a = [[UMSynchronizedArray alloc]init];
        for(UMDiameterAvpVendor_Specific_Application_Id *avp in _peer_vendor_specific_application_id)
        {
            [a addObject:avp.objectValue];
        }
        dict[@"peer-vendor-specific-application-id"] = a;
    }
    if(_peer_firmware_revision)
    {
        dict[@"peer-firmware-revision"] = _peer_firmware_revision.objectValue;
    }
    return dict;
}

- (void)startReopenTimer1
{
    if(_reopen_timer1_value > 0)
    {
        if(_reopenTimer1==NULL)
        {
            _reopenTimer1 = [[UMTimer alloc]initWithTarget:self
                                                 selector:@selector(reopenTimer1Event:)
                                                   object:NULL
                                                  seconds:_reopen_timer1_value
                                                     name:@"reopenTimer1"
                                                  repeats:NO
                                          runInForeground:YES];
        }
        else
        {
            _reopenTimer1.seconds = _reopen_timer1_value;
        }
        [_reopenTimer1 startIfNotRunning];
    }
}

- (void)startReopenTimer2
{
    if(_reopen_timer2_value > 0)
    {
        if(_reopenTimer2==NULL)
        {
            _reopenTimer2 = [[UMTimer alloc]initWithTarget:self
                                                 selector:@selector(reopenTimer2Event:)
                                                   object:NULL
                                                  seconds:_reopen_timer2_value
                                                     name:@"reopenTimer2"
                                                  repeats:NO
                                          runInForeground:YES];
        }
        else
        {
            _reopenTimer2.seconds = _reopen_timer2_value;
        }
        [_reopenTimer2 startIfNotRunning];
    }
}

- (void)startWatchdogTimer
{
    if(_watchdog_timer_value > 0)
    {
        if(_watchdogTimer==NULL)
        {
            _watchdogTimer = [[UMTimer alloc]initWithTarget:self
                                                 selector:@selector(watchdogTimerEvent:)
                                                   object:NULL
                                                  seconds:_watchdog_timer_value
                                                     name:@"watchdogTimer"
                                                  repeats:YES
                                          runInForeground:YES];
        }
        else
        {
            _watchdogTimer.seconds = _watchdog_timer_value;
        }
        [_watchdogTimer startIfNotRunning];
    }
}

- (void)stopReopenTimer1
{
    [_reopenTimer1 stop];
}

- (void)stopReopenTimer2
{
    [_reopenTimer2 stop];
}

- (void)stopWatchdogTimer
{
    [_watchdogTimer stop];
}

- (void)reopenTimer1Event:(id)dummy
{
    if([_peerState isKindOfClass:[UMDiameterPeerState_Closed class]])
    {
        [self powerOn];
    }
}

- (void)reopenTimer2Event:(id)dummy
{
    [_eventLock lock];
    if (  !([_peerState isKindOfClass:[UMDiameterPeerState_I_Open class]])
       && !([_peerState isKindOfClass:[UMDiameterPeerState_R_Open class]]))
    {

        [_initiator_socket close];
        [_responder_socket close];
    }
    _peerState = [[UMDiameterPeerState_Closed alloc]init];
    [_eventLock unlock];
    [_reopenTimer1 start];
}

- (void)watchdogTimerEvent:(id)dummy
{
    [_eventLock lock];
    _peerState = [_peerState eventWatchdogTimer:self message:NULL];
    [_eventLock unlock];
}

@end

