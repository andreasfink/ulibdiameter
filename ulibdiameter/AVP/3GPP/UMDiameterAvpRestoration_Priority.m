//
//  UMDiameterAvpRestoration_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRestoration_Priority.h"

@implementation UMDiameterAvpRestoration_Priority


- (NSString *)avpType
{
    return @"Restoration-Priority";
}

- (uint32_t)avpCode
{
    return 1663;
}

+ (uint32_t)avpCode
{
    return 1663;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

