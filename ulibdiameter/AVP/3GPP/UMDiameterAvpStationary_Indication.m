//
//  UMDiameterAvpStationary_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpStationary_Indication.h"

@implementation UMDiameterAvpStationary_Indication


- (NSString *)avpType
{
    return @"Stationary-Indication";
}

- (uint32_t)avpCode
{
    return 3119;
}

+ (uint32_t)avpCode
{
    return 3119;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

