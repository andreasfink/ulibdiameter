//
//  UMDiameterTcpConnection.h
//  ulibdiameter
//
//  Created by Andreas Fink on 14.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

#import "UMDiameterTcpListener.h"
#import "UMDiameterRouter.h"

@class UMDiameterTcpListener;
@class UMDiameterRouter;
@class UMSocket;

@interface UMDiameterTcpConnection : NSObject
{
	UMSocket 			*_socket;
	UMDiameterTcpListener 	*_listener;
	UMDiameterRouter 	*_router;
	UMDiameterPeer		*_peer;
	BOOL				_enableKeepalive;
	NSString			*_name;
}

@property(readwrite,strong,atomic)	UMSocket 			*socket;
@property(readwrite,strong,atomic)	UMDiameterTcpListener 	*listener;
@property(readwrite,strong,atomic)	UMDiameterRouter 	*router;
@property(readwrite,strong,atomic)	UMDiameterPeer		*peer;
@property(readwrite,assign,atomic)	BOOL				enableKeepalive;
@property(readwrite,strong,atomic)	NSString			*name;
- (UMDiameterTcpConnection *)initWithSocket:(UMSocket *)socket
								listener:(UMDiameterTcpListener *)listener
								  router:(UMDiameterRouter *)router;

- (void)terminate;

@end

