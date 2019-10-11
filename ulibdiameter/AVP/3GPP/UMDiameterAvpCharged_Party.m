//
//  UMDiameterAvpCharged_Party.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCharged_Party.h"

@implementation UMDiameterAvpCharged_Party


- (NSString *)avpType
{
    return @"Charged-Party";
}

- (uint32_t)avpCode
{
    return 857;
}

+ (uint32_t)avpCode
{
    return 857;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

