//
//  UMDiameterAvpMax_Requested_Bandwidth_DL.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMax_Requested_Bandwidth_DL.h"

@implementation UMDiameterAvpMax_Requested_Bandwidth_DL


- (NSString *)avpType
{
    return @"Max-Requested-Bandwidth-DL";
}

- (uint32_t)avpCode
{
    return 515;
}

+ (uint32_t)avpCode
{
    return 515;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

