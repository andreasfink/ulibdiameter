//
//  UMDiameterAvpService_Area_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Area_Identity.h"

@implementation UMDiameterAvpService_Area_Identity


- (NSString *)avpType
{
    return @"Service-Area-Identity";
}

- (uint32_t)avpCode
{
    return 1607;
}

+ (uint32_t)avpCode
{
    return 1607;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

