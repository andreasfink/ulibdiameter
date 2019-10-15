//
//  UMDiameterAvpVertical_Accuracy.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVertical_Accuracy.h"

@implementation UMDiameterAvpVertical_Accuracy


- (NSString *)avpType
{
    return @"Vertical-Accuracy";
}

- (uint32_t)avpCode
{
    return 2506;
}

+ (uint32_t)avpCode
{
    return 2506;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

