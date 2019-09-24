//
//  UMDiameterAvpCSG_Access_Mode.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCSG_Access_Mode.h"

@implementation UMDiameterAvpCSG_Access_Mode


- (NSString *)avpType
{
    return @"CSG-Access-Mode";
}

- (uint32_t)avpCode
{
    return 2317;
}

+ (uint32_t)avpCode
{
    return 2317;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

