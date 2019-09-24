//
//  UMDiameterAvpDeferred_Location_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDeferred_Location_Type.h"

@implementation UMDiameterAvpDeferred_Location_Type


- (NSString *)avpType
{
    return @"Deferred-Location-Type";
}

- (uint32_t)avpCode
{
    return 2532;
}

+ (uint32_t)avpCode
{
    return 2532;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

