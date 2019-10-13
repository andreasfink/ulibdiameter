//
//  UMDiameterAvpLinear_Distance.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLinear_Distance.h"

@implementation UMDiameterAvpLinear_Distance


- (NSString *)avpType
{
    return @"Linear-Distance";
}

- (uint32_t)avpCode
{
    return 2560;
}

+ (uint32_t)avpCode
{
    return 2560;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

