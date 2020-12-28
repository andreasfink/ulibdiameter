//
//  UMDiameterAvpComplete_Data_List_Included_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
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
    /* _vendorFlag = YES, _vendorCode = 10415 */
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"complete-data-list-included-indicator";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

