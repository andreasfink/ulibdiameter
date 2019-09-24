//
//  UMDiameterAvpLoss_Of_Connectivity_Reason.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoss_Of_Connectivity_Reason.h"

@implementation UMDiameterAvpLoss_Of_Connectivity_Reason


- (NSString *)avpType
{
    return @"Loss-Of-Connectivity-Reason";
}

- (uint32_t)avpCode
{
    return 3162;
}

+ (uint32_t)avpCode
{
    return 3162;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

