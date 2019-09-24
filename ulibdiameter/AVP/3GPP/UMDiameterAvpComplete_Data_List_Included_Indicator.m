//
//  UMDiameterAvpComplete_Data_List_Included_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpComplete_Data_List_Included_Indicator.h"

@implementation UMDiameterAvpComplete_Data_List_Included_Indicator


- (NSString *)avpType
{
    return @"Complete-Data-List-Included-Indicator";
}

- (uint32_t)avpCode
{
    return 1468;
}

+ (uint32_t)avpCode
{
    return 1468;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

