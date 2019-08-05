//
//  UMDiameterAvpRAT_Frequency_Selection_Priority_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRAT_Frequency_Selection_Priority_ID.h"

@implementation UMDiameterAvpRAT_Frequency_Selection_Priority_ID


- (NSString *)avpType
{
    return @"RAT-Frequency-Selection-Priority-ID";
}

- (uint32_t)avpCode
{
    return 1440;
}

+ (uint32_t)avpCode
{
    return 1440;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

