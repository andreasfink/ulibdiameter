//
//  UMDiameterAvpPPR_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPPR_Address.h"

@implementation UMDiameterAvpPPR_Address


- (NSString *)avpType
{
    return @"PPR-Address";
}

- (uint32_t)avpCode
{
    return 2407;
}

+ (uint32_t)avpCode
{
    return 2407;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

