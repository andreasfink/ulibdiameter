//
//  UMDiameterAvpGMLC_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGMLC_Number.h"

@implementation UMDiameterAvpGMLC_Number


- (NSString *)avpType
{
    return @"GMLC-Number";
}

- (uint32_t)avpCode
{
    return 1474;
}

+ (uint32_t)avpCode
{
    return 1474;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

