//
//  UMDiameterAvpE_UTRAN_Cell_Global_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpE_UTRAN_Cell_Global_Identity.h"

@implementation UMDiameterAvpE_UTRAN_Cell_Global_Identity


- (NSString *)avpType
{
    return @"E-UTRAN-Cell-Global-Identity";
}

- (uint32_t)avpCode
{
    return 1602;
}

+ (uint32_t)avpCode
{
    return 1602;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

