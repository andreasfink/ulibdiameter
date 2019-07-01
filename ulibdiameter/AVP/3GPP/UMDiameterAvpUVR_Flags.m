//
//  UMDiameterAvpUVR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpUVR_Flags


- (NSString *)avpType
{
    return @"UVR-Flags";
}

- (uint32_t)avpCode
{
    return 1639;
}

+ (uint32_t)avpCode
{
    return 1639;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

