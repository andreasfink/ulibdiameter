//
//  UMDiameterAvpMPS_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMPS_Priority.h"

@implementation UMDiameterAvpMPS_Priority


- (NSString *)avpType
{
    return @"MPS-Priority";
}

- (uint32_t)avpCode
{
    return 1616;
}

+ (uint32_t)avpCode
{
    return 1616;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end
