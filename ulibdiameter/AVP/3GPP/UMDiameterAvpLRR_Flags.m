//
//  UMDiameterAvpLRR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLRR_Flags.h"

@implementation UMDiameterAvpLRR_Flags


- (NSString *)avpType
{
    return @"LRR-Flags";
}

- (uint32_t)avpCode
{
    return 2530;
}

+ (uint32_t)avpCode
{
    return 2530;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

