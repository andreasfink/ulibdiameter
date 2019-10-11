//
//  UMDiameterAvpCall_Reference_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCall_Reference_Info.h"

@implementation UMDiameterAvpCall_Reference_Info


- (NSString *)avpType
{
    return @"Call-Reference-Info ";
}

- (uint32_t)avpCode
{
    return 720;
}

+ (uint32_t)avpCode
{
    return 720;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

