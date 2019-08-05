//
//  UMDiameterAvpSIPTO_Permission.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIPTO_Permission.h"

@implementation UMDiameterAvpSIPTO_Permission


- (NSString *)avpType
{
    return @"SIPTO-Permission";
}

- (uint32_t)avpCode
{
    return 1613;
}

+ (uint32_t)avpCode
{
    return 1613;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

