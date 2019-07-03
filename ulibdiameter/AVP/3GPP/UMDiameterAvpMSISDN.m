//
//  UMDiameterAvpMSISDN.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMSISDN.h"

@implementation UMDiameterAvpMSISDN


- (NSString *)avpType
{
    return @"MSISDN";
}

- (uint32_t)avpCode
{
    return 701;
}

+ (uint32_t)avpCode
{
    return 701;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end
