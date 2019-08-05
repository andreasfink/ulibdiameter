//
//  UMDiameterAvpSoftware_Version.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSoftware_Version.h"

@implementation UMDiameterAvpSoftware_Version


- (NSString *)avpType
{
    return @"Software-Version";
}

- (uint32_t)avpCode
{
    return 1403;
}

+ (uint32_t)avpCode
{
    return 1403;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

