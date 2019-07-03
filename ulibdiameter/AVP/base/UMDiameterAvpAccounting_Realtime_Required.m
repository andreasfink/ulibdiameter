//
//  UMDiameterAvpAccounting_Realtime_Required.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:49:36.549000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccounting_Realtime_Required.h"

@implementation UMDiameterAvpAccounting_Realtime_Required


- (NSString *)avpType
{
    return @"Accounting-Realtime-Required";
}

- (uint32_t)avpCode
{
    return 483;
}

+ (uint32_t)avpCode
{
    return 483;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

