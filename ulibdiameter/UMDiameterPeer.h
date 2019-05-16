//
//  UMDiameterPeer.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibsctp/ulibsctp.h>

@class UMDiameterPeerState;
@class UMDiameterRouter;
@class UMDiameterConnection;

@interface UMDiameterPeer : UMLayer<UMLayerUserProtocol>
{
	BOOL					_tcpPeer;
	NSString				*_tcpRemoteIP;
	int						_tcpRemotePort;
	UMDiameterConnection	*_tcpConnection;
    UMLayerSctp             *_sctp;
    UMDiameterRouter        *_router;
    SCTP_Status             _sctpStatus;
    UMDiameterPeerState     *_peerState;

    BOOL                    _isConnected;
    BOOL                    _isActive;
    BOOL                    _isConnecting;
    BOOL                    _isForcedOutOfService;
}

@property(readwrite,assign,atomic)		BOOL					tcpPeer;
@property(readwrite,strong,atomic)		NSString				*tcpRemoteIP;
@property(readwrite,assign,atomic)		int						tcpRemotePort;
@property(readwrite,strong,atomic)		UMDiameterConnection	*tcpConnection;
@property(readwrite,strong,atomic)      UMLayerSctp             *sctp;
@property(readwrite,strong,atomic)      UMDiameterRouter        *router;
@property(readwrite,strong,atomic)      UMDiameterPeerState     *peerState;
@property(readwrite,assign,atomic)      BOOL                    isConnected;
@property(readwrite,assign,atomic)      BOOL                    isActive;
@property(readwrite,assign,atomic)      BOOL                    isConnecting;
@property(readwrite,assign,atomic)      BOOL                    isForcedOutOfService;


@end


