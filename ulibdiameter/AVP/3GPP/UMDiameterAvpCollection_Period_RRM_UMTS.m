//
//  UMDiameterAvpCollection_Period_RRM_UMTS.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCollection_Period_RRM_UMTS.h"

@implementation UMDiameterAvpCollection_Period_RRM_UMTS


- (NSString *)avpType
{
    return @"Collection-Period-RRM-UMTS";
}

- (uint32_t)avpCode
{
    return 1658;
}

+ (uint32_t)avpCode
{
    return 1658;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

