//
//  UMDiameterAvpSubscription_Data_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpSubscription_Data_Flags


- (NSString *)avpType
{
    return @"Subscription-Data-Flags";
}

- (uint32_t)avpCode
{
    return 1654;
}

+ (uint32_t)avpCode
{
    return 1654;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

