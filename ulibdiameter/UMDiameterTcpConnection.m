//
//  UMDiameterTcpConnection.m
//  ulibdiameter
//
//  Created by Andreas Fink on 14.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterTcpConnection.h"

#import "UMDiameterTcpListener.h"
#import "UMDiameterRouter.h"

@implementation UMDiameterTcpConnection


- (UMDiameterTcpConnection *)initWithSocket:(UMSocket *)socket
								listener:(UMDiameterTcpListener *)listener
								  router:(UMDiameterRouter *)router
{
	self = [super init];
	if(self)
	{
		_listener = listener;
		_router = router;
		_socket = socket;
	}
	return self;
}

- (void)terminate
{
	/* send anything before the socket gets closed */
}
@end
