//
//  UMDiameterAvpRegional_Subscription_Zone_Code.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRegional_Subscription_Zone_Code.h"

@implementation UMDiameterAvpRegional_Subscription_Zone_Code


- (NSString *)avpType
{
    return @"Regional-Subscription-Zone-Code";
}

- (uint32_t)avpCode
{
    return 1446;
}

+ (uint32_t)avpCode
{
    return 1446;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

