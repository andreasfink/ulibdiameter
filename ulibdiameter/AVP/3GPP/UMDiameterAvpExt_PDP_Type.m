//
//  UMDiameterAvpExt_PDP_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExt_PDP_Type.h"

@implementation UMDiameterAvpExt_PDP_Type


- (NSString *)avpType
{
    return @"Ext-PDP-Type";
}

- (uint32_t)avpCode
{
    return 1620;
}

+ (uint32_t)avpCode
{
    return 1620;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

