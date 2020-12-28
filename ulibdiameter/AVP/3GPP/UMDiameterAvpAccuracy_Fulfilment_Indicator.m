//
//  UMDiameterAvpAccuracy_Fulfilment_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccuracy_Fulfilment_Indicator.h"

@implementation UMDiameterAvpAccuracy_Fulfilment_Indicator


- (NSString *)avpType
{
    return @"Accuracy-Fulfilment-Indicator";
}

- (uint32_t)avpCode
{
    return 2513;
}

+ (uint32_t)avpCode
{
    return 2513;
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
    avpDef[@"name"] = @"accuracy-fulfilment-indicator";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

