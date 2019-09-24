//
//  UMDiameterAvpActive_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpActive_Time.h"

@implementation UMDiameterAvpActive_Time


- (NSString *)avpType
{
    return @"Active-Time";
}

- (uint32_t)avpCode
{
    return 4324;
}

+ (uint32_t)avpCode
{
    return 4324;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

