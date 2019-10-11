//
//  UMDiameterAvpPre_paging_Supported.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPre_paging_Supported.h"

@implementation UMDiameterAvpPre_paging_Supported


- (NSString *)avpType
{
    return @"Pre-paging-Supported ";
}

- (uint32_t)avpCode
{
    return 717;
}

+ (uint32_t)avpCode
{
    return 717;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

