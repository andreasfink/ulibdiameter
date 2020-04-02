//
//  UMDiameterRouterReceiver.h
//  ulibdiameter
//
//  Created by Andreas Fink on 03.03.2020.
//  Copyright © 2020 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterRouter;

@interface UMDiameterRouterReceiver : UMBackgrounder
{
    UMDiameterRouter *_router;
    int _timeoutInMs;
    
}
- (UMDiameterRouterReceiver *)initWithRouter:(UMDiameterRouter *)r;

@end

