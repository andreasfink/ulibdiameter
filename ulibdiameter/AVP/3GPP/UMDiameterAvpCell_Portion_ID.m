//
//  UMDiameterAvpCell_Portion_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCell_Portion_ID.h"

@implementation UMDiameterAvpCell_Portion_ID


- (NSString *)avpType
{
    return @"Cell-Portion-ID";
}

- (uint32_t)avpCode
{
    return 2553;
}

+ (uint32_t)avpCode
{
    return 2553;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

