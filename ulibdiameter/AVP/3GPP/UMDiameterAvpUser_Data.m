//
//  UMDiameterAvpUser_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_Data.h"

@implementation UMDiameterAvpUser_Data


- (NSString *)avpType
{
    return @"User-Data";
}

- (uint32_t)avpCode
{
    return 606;
}

+ (uint32_t)avpCode
{
    return 606;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

