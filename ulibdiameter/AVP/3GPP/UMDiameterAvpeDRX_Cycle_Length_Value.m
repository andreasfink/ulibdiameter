//
//  UMDiameterAvpeDRX_Cycle_Length_Value.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpeDRX_Cycle_Length_Value.h"

@implementation UMDiameterAvpeDRX_Cycle_Length_Value


- (NSString *)avpType
{
    return @"eDRX-Cycle-Length-Value";
}

- (uint32_t)avpCode
{
    return 1692;
}

+ (uint32_t)avpCode
{
    return 1692;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

