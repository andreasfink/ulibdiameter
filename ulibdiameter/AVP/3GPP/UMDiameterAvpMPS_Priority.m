//
//  UMDiameterAvpMPS_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
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

