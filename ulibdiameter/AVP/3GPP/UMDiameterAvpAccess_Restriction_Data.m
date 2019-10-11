//
//  UMDiameterAvpAccess_Restriction_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccess_Restriction_Data.h"

@implementation UMDiameterAvpAccess_Restriction_Data


- (NSString *)avpType
{
    return @"Access-Restriction-Data";
}

- (uint32_t)avpCode
{
    return 1426;
}

+ (uint32_t)avpCode
{
    return 1426;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

