//
//  UMDiameterAvpUser_CSG_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_CSG_Information.h"

@implementation UMDiameterAvpUser_CSG_Information


- (NSString *)avpType
{
    return @"User-CSG-Information";
}

- (uint32_t)avpCode
{
    return 2319;
}

+ (uint32_t)avpCode
{
    return 2319;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

