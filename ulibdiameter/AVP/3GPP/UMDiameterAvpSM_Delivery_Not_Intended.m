//
//  UMDiameterAvpSM_Delivery_Not_Intended.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSM_Delivery_Not_Intended.h"

@implementation UMDiameterAvpSM_Delivery_Not_Intended


- (NSString *)avpType
{
    return @"SM-Delivery-Not-Intended";
}

- (uint32_t)avpCode
{
    return 3311;
}

+ (uint32_t)avpCode
{
    return 3311;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"sm-delivery-not-intended";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

