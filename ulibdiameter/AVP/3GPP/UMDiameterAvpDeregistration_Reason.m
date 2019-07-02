//
//  UMDiameterAvpDeregistration_Reason.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDeregistration_Reason.h"

@implementation UMDiameterAvpDeregistration_Reason


- (NSString *)avpType
{
    return @"Deregistration-Reason";
}

- (uint32_t)avpCode
{
    return 615;
}

+ (uint32_t)avpCode
{
    return 615;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

