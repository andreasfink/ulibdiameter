//
//  UMDiameterAvpRecord_Route.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRecord_Route.h"

@implementation UMDiameterAvpRecord_Route


- (NSString *)avpType
{
    return @"Record-Route";
}

- (uint32_t)avpCode
{
    return 646;
}

+ (uint32_t)avpCode
{
    return 646;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

