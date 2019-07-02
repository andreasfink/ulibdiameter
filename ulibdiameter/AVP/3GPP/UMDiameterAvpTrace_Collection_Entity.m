//
//  UMDiameterAvpTrace_Collection_Entity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTrace_Collection_Entity.h"

@implementation UMDiameterAvpTrace_Collection_Entity


- (NSString *)avpType
{
    return @"Trace-Collection-Entity";
}

- (uint32_t)avpCode
{
    return 1452;
}

+ (uint32_t)avpCode
{
    return 1452;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

