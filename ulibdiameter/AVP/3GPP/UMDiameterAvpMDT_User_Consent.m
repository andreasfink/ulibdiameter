//
//  UMDiameterAvpMDT_User_Consent.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMDT_User_Consent.h"

@implementation UMDiameterAvpMDT_User_Consent


- (NSString *)avpType
{
    return @"MDT-User-Consent";
}

- (uint32_t)avpCode
{
    return 1634;
}

+ (uint32_t)avpCode
{
    return 1634;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

