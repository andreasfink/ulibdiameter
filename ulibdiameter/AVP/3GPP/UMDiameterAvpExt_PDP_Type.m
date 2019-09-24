//
//  UMDiameterAvpExt_PDP_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
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

