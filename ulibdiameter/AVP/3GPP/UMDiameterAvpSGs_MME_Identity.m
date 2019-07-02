//
//  UMDiameterAvpSGs_MME_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSGs_MME_Identity.h"

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


@end

