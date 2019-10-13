//
//  UMDiameterAvpMSISDN.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
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

