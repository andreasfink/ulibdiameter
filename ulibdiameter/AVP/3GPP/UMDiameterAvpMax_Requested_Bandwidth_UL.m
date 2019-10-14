//
//  UMDiameterAvpMax_Requested_Bandwidth_UL.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMax_Requested_Bandwidth_UL.h"

@implementation UMDiameterAvpMax_Requested_Bandwidth_UL


- (NSString *)avpType
{
    return @"Max-Requested-Bandwidth-UL";
}

- (uint32_t)avpCode
{
    return 516;
}

+ (uint32_t)avpCode
{
    return 516;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

