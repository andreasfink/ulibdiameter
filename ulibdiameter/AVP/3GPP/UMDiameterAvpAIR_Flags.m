//
//  UMDiameterAvpAIR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAIR_Flags.h"

@implementation UMDiameterAvpAIR_Flags


- (NSString *)avpType
{
    return @"AIR-Flags";
}

- (uint32_t)avpCode
{
    return 1679;
}

+ (uint32_t)avpCode
{
    return 1679;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

