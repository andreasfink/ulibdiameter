//
//  UMDiameterRoute.h
//  ulibdiameter
//
//  Created by Andreas Fink on 03.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@interface UMDiameterRoute : UMObject
{
    NSString *_hostname;
    NSString *_realm;
    NSNumber *_applicationId;
    NSString *_sessionId;
    BOOL     _oneTimeRoute;
}

@end
