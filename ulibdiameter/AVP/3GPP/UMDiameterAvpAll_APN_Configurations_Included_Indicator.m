//
//  UMDiameterAvpAll_APN_Configurations_Included_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAll_APN_Configurations_Included_Indicator.h"

@implementation UMDiameterAvpAll_APN_Configurations_Included_Indicator


- (NSString *)avpType
{
    return @"All-APN-Configurations-Included-Indicator";
}

- (uint32_t)avpCode
{
    return 1428;
}

+ (uint32_t)avpCode
{
    return 1428;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

