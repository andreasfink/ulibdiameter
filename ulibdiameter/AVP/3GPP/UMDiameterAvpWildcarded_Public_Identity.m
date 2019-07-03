//
//  UMDiameterAvpWildcarded_Public_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWildcarded_Public_Identity.h"

@implementation UMDiameterAvpWildcarded_Public_Identity


- (NSString *)avpType
{
    return @"Wildcarded-Public-Identity";
}

- (uint32_t)avpCode
{
    return 634;
}

+ (uint32_t)avpCode
{
    return 634;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end
