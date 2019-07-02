//
//  UMDiameterAvpCharging_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCharging_Information.h"

@implementation UMDiameterAvpCharging_Information


- (NSString *)avpType
{
    return @"Charging-Information";
}

- (uint32_t)avpCode
{
    return 618;
}

+ (uint32_t)avpCode
{
    return 618;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

