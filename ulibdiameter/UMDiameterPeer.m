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
#import <ulibsctp/ulibsctp.h>

#define     SEND_ORIGIN_STATE_ID_IN_DWR 1

#define RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(sel,obj) \
    [self runSelectorInBackground:sel \
                        withObject:obj \
                         file:__FILE__ line:__LINE__  function:__func__]

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
    _sctpStatus_i = SCTP_STATUS_OFF;
    _sctpStatus_r = SCTP_STATUS_OFF;
    _outstandingWatchdogEvents = 0;
    _maxOutstandingWatchdogEvents = 3;
    _eventLock = [[UMMutex alloc]initWithName:@"diameter-event-lock"];

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
    [_peerState eventSend_Message:self message:packet];
    [_eventLock unlock];
}

- (void)_eventStopTask:(id)obj
{
    [_eventLock lock];
    [_peerState eventStop:self message:obj];
    [_eventLock unlock];
}

- (void)_eventStartTask:(id)obj
{
    [_eventLock lock];
    [_peerState eventStart:self message:obj];
    [_eventLock unlock];
}




#pragma mark -
#pragma mark Methods

- (void) watchdogTimerEvent
{
    RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_watchdogTimerEventTask:),NULL);
}



- (void) sctpStatusIndication:(UMLayer *)caller
                       userId:(id)uid
                       status:(SCTP_Status)statusNew
{
    UMSocket *sock = NULL;
    SCTP_Status previousStatus;
    BOOL initiator;

    if([caller isEqualTo:_initiator_socket])
    {
        sock = _initiator_socket;
        previousStatus = _sctpStatus_i;
        initiator = YES;
    }
    else if([caller isEqualTo:_responder_socket])
    {
        sock = _responder_socket;
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
                RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_Conn_NackTask:),NULL);
            }
            else
            {
                RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_Conn_NackTask:),NULL);
            }
            break;
        }
        case SCTP_STATUS_OFF:
        {
            NSString *s = [NSString stringWithFormat:@"SCTP-Status-Change: %@->OFF",oldStatusString];
            [self.logFeed infoText:s];
            if(initiator)
            {
                RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_Conn_NackTask:),NULL);
            }
            else
            {
                RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_Conn_NackTask:),NULL);
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
                RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventI_Rcv_Conn_AckTask:),NULL);

            }
            else
            {
                RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT(@selector(_eventR_Rcv_Conn_AckTask:),NULL);
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
    UMSocket *sock = NULL;
    BOOL initiator;

    if([caller isEqualTo:_initiator_socket])
    {
        sock = _initiator_socket;
        initiator = YES;
    }
    else if([caller isEqualTo:_responder_socket])
    {
        sock = _responder_socket;
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
             _configuredLocalAddresses = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" \n\r\t;,"]];
         }
         else if([local_ip_object isKindOfClass:[UMSynchronizedArray class]])
         {
             UMSynchronizedArray *ua = (UMSynchronizedArray *)local_ip_object;
             _configuredLocalAddresses = [ua.array copy];
         }
         else if([local_ip_object isKindOfClass:[NSArray class]])
         {
             NSArray *arr = (NSArray *)local_ip_object;
             _configuredLocalAddresses = [arr copy];
         }
     }
     else
     {
         NSLog(@"Warning: no local-ip defined in %@",self.layerName);
     }
     if (cfg[@"local-port"])
     {
         _configuredLocalPort = [cfg[@"local-port"] intValue];
     }
     if (cfg[@"remote-ip"])
     {
         id remote_ip_object = cfg[@"remote-ip"];
         if([remote_ip_object isKindOfClass:[NSString class]])
         {
             NSString *line = (NSString *)remote_ip_object;
             _configuredRemoteAddresses = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" \n\r\t;,"]];
         }
         else if([remote_ip_object isKindOfClass:[UMSynchronizedArray class]])
         {
             UMSynchronizedArray *ua = (UMSynchronizedArray *)remote_ip_object;
             _configuredRemoteAddresses = [ua.array copy];
         }
         else if([remote_ip_object isKindOfClass:[NSArray class]])
         {
             NSArray *arr = (NSArray *)remote_ip_object;
             _configuredRemoteAddresses = [arr copy];
         }
     }
     if (cfg[@"remote-port"])
     {
         _configuredRemotePort = [cfg[@"remote-port"] intValue];
     }
     if (cfg[@"heartbeat"])
     {
         _heartbeatSeconds = [cfg[@"heartbeat"] doubleValue];
     }
     if (cfg[@"mtu"])
     {
         _mtu = [cfg[@"mtu"] intValue];
     }
    
    if(_tcpPeer)
    {
        _initiator_socket = [[UMSocket alloc]initWithType:UMSOCKET_TYPE_TCP];
        _responder_socket = [[UMSocket alloc]initWithType:UMSOCKET_TYPE_TCP];
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
        _initiator_socket.requestedRemotePort = _configuredRemotePort;
        _responder_socket.requestedLocalPort = _configuredLocalPort;
    }
    else
    {
        UMSocketSCTP *is = [[UMSocketSCTP alloc]initWithType:UMSOCKET_TYPE_SCTP];
        UMSocketSCTP *rs = [[UMSocketSCTP alloc]initWithType:UMSOCKET_TYPE_SCTP];
        is.requestedRemoteAddresses = _configuredRemoteAddresses;
        is.requestedLocalAddresses = _configuredLocalAddresses;
        is.requestedRemotePort = _configuredRemotePort;
        is.requestedLocalPort = 0;
        rs.requestedRemotePort = 0;
        rs.requestedLocalPort = _configuredLocalPort;
        rs.requestedRemoteAddresses = _configuredRemoteAddresses;
        rs.requestedLocalAddresses = _configuredLocalAddresses;

        [is updateMtu:_mtu];
        [rs updateMtu:_mtu];
        [is switchToNonBlocking];
        [rs switchToNonBlocking];
        [is setNoDelay];
        [rs setNoDelay];
        [is setInitParams];
        [rs setInitParams];

        [is setIPDualStack];
        [rs setIPDualStack];

        [is setLinger];
        [rs setLinger];
        [is setReuseAddr];
        [rs setReuseAddr];
        [is setReusePort];
        [rs setReusePort];
        [is enableEvents];
        [rs enableEvents];


        UMSocketError err = [is bind];
        if(err!=UMSocketError_no_error)
        {
            [self logMajorError:[NSString stringWithFormat:@"can not bind initiator on %@: %d %@",_layerName,err,[UMSocket getSocketErrorString:err]]];
        }
        err = [rs bind];
        {
            [self logMajorError:[NSString stringWithFormat:@"can not bind responder on %@: %d %@",_layerName,err,[UMSocket getSocketErrorString:err]]];
        }
        [is setHeartbeat:YES];
        [rs setHeartbeat:YES];
        _initiator_socket = is;
        _responder_socket = rs;
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
    RUN_SELECTOR_IN_BACKGROUND_WITH_OBJECT( @selector(_eventStoptask:), NULL);
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
- (void)sendMessageTask:(UMDiameterPacket *)packet
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
    [_initiator_socket connect];
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
        uint32_t        tmp_assocId = -1;
        ssize_t sent_packets = [sctp sendToAddresses:_configuredRemoteAddresses
                                                port:_configuredRemotePort
                                               assoc:&tmp_assocId
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
    [self sendData:data socket:_initiator_socket];

}

- (void)actionR_Snd_Message:(UMDiameterPacket *)message
{
    [message beforeEncode];
    NSData *data = [message packedData];
    [self sendData:data socket:_responder_socket];
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
    [s appendFormat:@":(%@:%d->%@:%d)",loc,_configuredLocalPort,rem,_configuredRemotePort];
    SCTP_Status status;
    if(_isIncoming)
    {
        [s appendString:@":responder"];
        status = _sctpStatus_r;
    }
    else
    {
        [s appendString:@":initiator"];
        status = _sctpStatus_i;
    }
    switch(status)
    {
            case    SCTP_STATUS_M_FOOS:
                [s appendString:@":M-FOOS"];
                break;
            case    SCTP_STATUS_OFF:
                [s appendString:@":OFF"];
                break;
            case    SCTP_STATUS_OOS:
                [s appendString:@":OOS"];
                break;
            case    SCTP_STATUS_IS:
                [s appendString:@":IS"];
                break;
            default:
                [s appendFormat:@":unknown(%d)",status];
                break;
    }
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
@end

