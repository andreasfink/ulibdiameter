//
//  UMDiameterAvpWildcarded_IMPU.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWildcarded_IMPU.h"

@implementation UMDiameterAvpWildcarded_IMPU


- (NSString *)avpType
{
    return @"Wildcarded-IMPU";
}

- (uint32_t)avpCode
{
    return 636;
}

+ (uint32_t)avpCode
{
    return 636;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

