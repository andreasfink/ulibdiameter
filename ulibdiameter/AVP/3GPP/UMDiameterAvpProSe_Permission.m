//
//  UMDiameterAvpProSe_Permission.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpProSe_Permission.h"

@implementation UMDiameterAvpProSe_Permission


- (NSString *)avpType
{
    return @"ProSe-Permission";
}

- (uint32_t)avpCode
{
    return 3702;
}

+ (uint32_t)avpCode
{
    return 3702;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

