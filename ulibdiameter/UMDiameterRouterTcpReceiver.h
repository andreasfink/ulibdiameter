//
//  UMDiameterRouterTcpReceiver.h
//  ulibdiameter
//
//  Created by Andreas Fink on 03.03.2020.
//  Copyright © 2020 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterRouter;

@interface UMDiameterRouterTcpReceiver : UMBackgrounder
{
    UMDiameterRouter *_router;
    int _timeoutInMs;
    
}

@end

