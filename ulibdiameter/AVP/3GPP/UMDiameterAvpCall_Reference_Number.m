//
//  UMDiameterAvpCall_Reference_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCall_Reference_Number.h"

@implementation UMDiameterAvpCall_Reference_Number


- (NSString *)avpType
{
    return @"Call-Reference-Number";
}

- (uint32_t)avpCode
{
    return 721;
}

+ (uint32_t)avpCode
{
    return 721;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

