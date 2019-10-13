//
//  UMDiameterAvpPDP_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPDP_Type.h"

@implementation UMDiameterAvpPDP_Type


- (NSString *)avpType
{
    return @"PDP-Type";
}

- (uint32_t)avpCode
{
    return 1470;
}

+ (uint32_t)avpCode
{
    return 1470;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

