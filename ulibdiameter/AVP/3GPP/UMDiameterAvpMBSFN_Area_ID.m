//
//  UMDiameterAvpMBSFN_Area_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMBSFN_Area_ID.h"

@implementation UMDiameterAvpMBSFN_Area_ID


- (NSString *)avpType
{
    return @"MBSFN-Area-ID";
}

- (uint32_t)avpCode
{
    return 1695;
}

+ (uint32_t)avpCode
{
    return 1695;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end
