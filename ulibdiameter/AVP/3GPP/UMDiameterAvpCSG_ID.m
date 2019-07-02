//
//  UMDiameterAvpCSG_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCSG_ID.h"

@implementation UMDiameterAvpCSG_ID


- (NSString *)avpType
{
    return @"CSG-ID";
}

- (uint32_t)avpCode
{
    return 1437;
}

+ (uint32_t)avpCode
{
    return 1437;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

