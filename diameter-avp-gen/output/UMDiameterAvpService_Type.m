//
//  UMDiameterAvpService_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpService_Type


- (NSString *)avpType
{
    return @"Service-Type";
}

- (uint32_t)avpCode
{
    return 1483;
}

+ (uint32_t)avpCode
{
    return 1483;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

