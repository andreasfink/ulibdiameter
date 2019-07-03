//
//  UMDiameterAvpUE_Usage_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUE_Usage_Type.h"

@implementation UMDiameterAvpUE_Usage_Type


- (NSString *)avpType
{
    return @"UE-Usage-Type";
}

- (uint32_t)avpCode
{
    return 1680;
}

+ (uint32_t)avpCode
{
    return 1680;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end
