//
//  UMDiameterAvpKc.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpKc


- (NSString *)avpType
{
    return @"Kc";
}

- (uint32_t)avpCode
{
    return 1453;
}

+ (uint32_t)avpCode
{
    return 1453;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

