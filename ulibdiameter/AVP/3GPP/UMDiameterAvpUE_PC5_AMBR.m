//
//  UMDiameterAvpUE_PC5_AMBR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUE_PC5_AMBR.h"

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


@end
