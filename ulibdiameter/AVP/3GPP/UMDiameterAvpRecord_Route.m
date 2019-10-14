//
//  UMDiameterAvpRecord_Route.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
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

