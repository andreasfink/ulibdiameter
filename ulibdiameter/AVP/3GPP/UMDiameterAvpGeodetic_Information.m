//
//  UMDiameterAvpGeodetic_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGeodetic_Information.h"

@implementation UMDiameterAvpGeodetic_Information


- (NSString *)avpType
{
    return @"Geodetic-Information";
}

- (uint32_t)avpCode
{
    return 1609;
}

+ (uint32_t)avpCode
{
    return 1609;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end
