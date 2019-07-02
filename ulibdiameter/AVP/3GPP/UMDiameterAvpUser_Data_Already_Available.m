//
//  UMDiameterAvpUser_Data_Already_Available.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_Data_Already_Available.h"

@implementation UMDiameterAvpUser_Data_Already_Available


- (NSString *)avpType
{
    return @"User-Data-Already-Available";
}

- (uint32_t)avpCode
{
    return 624;
}

+ (uint32_t)avpCode
{
    return 624;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

