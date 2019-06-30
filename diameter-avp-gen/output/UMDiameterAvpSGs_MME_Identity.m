//
//  UMDiameterAvpSGs_MME_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTF8String.h"

@implementation UMDiameterAvpSGs_MME_Identity


- (NSString *)avpType
{
    return @"SGs-MME-Identity";
}

- (uint32_t)avpCode
{
    return 1664;
}

+ (uint32_t)avpCode
{
    return 1664;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

