//
//  UMDiameterAvpReset_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReset_ID.h"

@implementation UMDiameterAvpReset_ID


- (NSString *)avpType
{
    return @"Reset-ID";
}

- (uint32_t)avpCode
{
    return 1670;
}

+ (uint32_t)avpCode
{
    return 1670;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

