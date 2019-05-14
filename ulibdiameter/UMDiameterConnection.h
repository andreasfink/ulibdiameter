//
//  UMDiameterConnection.h
//  ulibdiameter
//
//  Created by Andreas Fink on 14.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

#import "UMDiameterListener.h"
#import "UMDiameterRouter.h"

@class UMDiameterListener;
@class UMDiameterRouter;
@class UMSocket;

@interface UMDiameterConnection : NSObject
{
	UMSocket 			*_socket;
	UMDiameterListener 	*_listener;
	UMDiameterRouter 	*_router;

	BOOL				_enableKeepalive;
	NSString			*_name;
}

@property(readwrite,strong,atomic)	UMSocket 			*socket;
@property(readwrite,strong,atomic)	UMDiameterListener 	*listener;
@property(readwrite,strong,atomic)	UMDiameterRouter 	*router;
@property(readwrite,assign,atomic)	BOOL				enableKeepalive;
@property(readwrite,strong,atomic)	NSString			*name;
- (UMDiameterConnection *)initWithSocket:(UMSocket *)socket
								listener:(UMDiameterListener *)listener
								  router:(UMDiameterRouter *)router;

- (void)terminate;

@end

