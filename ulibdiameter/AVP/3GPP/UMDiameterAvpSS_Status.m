//
//  UMDiameterAvpSS_Status.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSS_Status.h"

@implementation UMDiameterAvpSS_Status


- (NSString *)avpType
{
    return @"SS-Status";
}

- (uint32_t)avpCode
{
    return 1477;
}

+ (uint32_t)avpCode
{
    return 1477;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

