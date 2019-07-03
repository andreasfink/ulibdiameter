//
//  UMDiameterAvpSession_Timeout.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSession_Timeout.h"

@implementation UMDiameterAvpSession_Timeout


- (NSString *)avpType
{
    return @"Session-Timeout";
}

- (uint32_t)avpCode
{
    return 27;
}

+ (uint32_t)avpCode
{
    return 27;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end
