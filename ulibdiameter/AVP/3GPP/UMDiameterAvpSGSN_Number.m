//
//  UMDiameterAvpSGSN_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSGSN_Number.h"

@implementation UMDiameterAvpSGSN_Number


- (NSString *)avpType
{
    return @"SGSN-Number";
}

- (uint32_t)avpCode
{
    return 1489;
}

+ (uint32_t)avpCode
{
    return 1489;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

