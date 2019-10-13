//
//  UMDiameterAvpUser_State.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_State.h"

@implementation UMDiameterAvpUser_State


- (NSString *)avpType
{
    return @"User-State";
}

- (uint32_t)avpCode
{
    return 1499;
}

+ (uint32_t)avpCode
{
    return 1499;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

