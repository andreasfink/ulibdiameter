//
//  UMDiameterConnection.m
//  ulibdiameter
//
//  Created by Andreas Fink on 14.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterConnection.h"

#import "UMDiameterListener.h"
#import "UMDiameterRouter.h"

@implementation UMDiameterConnection


- (UMDiameterConnection *)initWithSocket:(UMSocket *)socket
								listener:(UMDiameterListener *)listener
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
