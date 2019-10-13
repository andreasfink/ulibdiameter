//
//  UMDiameterAvpExt_PDP_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExt_PDP_Address.h"

@implementation UMDiameterAvpExt_PDP_Address


- (NSString *)avpType
{
    return @"Ext-PDP-Address";
}

- (uint32_t)avpCode
{
    return 1621;
}

+ (uint32_t)avpCode
{
    return 1621;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

