//
//  UMDiameterAvpMax_Supported_Bandwidth_DL.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMax_Supported_Bandwidth_DL.h"

@implementation UMDiameterAvpMax_Supported_Bandwidth_DL


- (NSString *)avpType
{
    return @"Max-Supported-Bandwidth-DL";
}

- (uint32_t)avpCode
{
    return 543;
}

+ (uint32_t)avpCode
{
    return 543;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

