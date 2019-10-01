//
//  UMDiameterAvpPrioritized_List_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPrioritized_List_Indicator.h"

@implementation UMDiameterAvpPrioritized_List_Indicator


- (NSString *)avpType
{
    return @"Prioritized-List-Indicator";
}

- (uint32_t)avpCode
{
    return 2551;
}

+ (uint32_t)avpCode
{
    return 2551;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

