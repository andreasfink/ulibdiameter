//
//  UMDiameterAvpReport_Amount.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpReport_Amount


- (NSString *)avpType
{
    return @"Report-Amount";
}

- (uint32_t)avpCode
{
    return 1628;
}

+ (uint32_t)avpCode
{
    return 1628;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

