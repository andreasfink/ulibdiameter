//
//  UMDiameterAvpConfidentiality_Key.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpConfidentiality_Key.h"

@implementation UMDiameterAvpConfidentiality_Key


- (NSString *)avpType
{
    return @"Confidentiality-Key";
}

- (uint32_t)avpCode
{
    return 625;
}

+ (uint32_t)avpCode
{
    return 625;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

