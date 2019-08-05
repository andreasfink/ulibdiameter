//
//  UMDiameterAvpTrace_Depth.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTrace_Depth.h"

@implementation UMDiameterAvpTrace_Depth


- (NSString *)avpType
{
    return @"Trace-Depth";
}

- (uint32_t)avpCode
{
    return 1462;
}

+ (uint32_t)avpCode
{
    return 1462;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

