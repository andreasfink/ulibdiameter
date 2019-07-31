//
//  UMDiameterAvpAcct_Interim_Interval.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.283000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAcct_Interim_Interval.h"

@implementation UMDiameterAvpAcct_Interim_Interval


- (NSString *)avpType
{
    return @"Acct-Interim-Interval";
}

- (uint32_t)avpCode
{
    return 85;
}

+ (uint32_t)avpCode
{
    return 85;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

