//
//  UMDiameterAvpUE_PC5_AMBR.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpUE_PC5_AMBR


- (NSString *)avpType
{
    return @"UE-PC5-AMBR";
}

- (uint32_t)avpCode
{
    return 1693;
}

+ (uint32_t)avpCode
{
    return 1693;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

