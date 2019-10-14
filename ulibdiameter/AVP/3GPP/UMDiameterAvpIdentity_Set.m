//
//  UMDiameterAvpIdentity_Set.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIdentity_Set.h"

@implementation UMDiameterAvpIdentity_Set


- (NSString *)avpType
{
    return @"Identity-Set";
}

- (uint32_t)avpCode
{
    return 708;
}

+ (uint32_t)avpCode
{
    return 708;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

