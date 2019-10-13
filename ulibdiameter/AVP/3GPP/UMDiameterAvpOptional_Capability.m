//
//  UMDiameterAvpOptional_Capability.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOptional_Capability.h"

@implementation UMDiameterAvpOptional_Capability


- (NSString *)avpType
{
    return @"Optional-Capability";
}

- (uint32_t)avpCode
{
    return 605;
}

+ (uint32_t)avpCode
{
    return 605;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

