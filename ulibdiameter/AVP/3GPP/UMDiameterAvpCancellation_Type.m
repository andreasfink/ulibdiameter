//
//  UMDiameterAvpCancellation_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCancellation_Type.h"

@implementation UMDiameterAvpCancellation_Type


- (NSString *)avpType
{
    return @"Cancellation-Type";
}

- (uint32_t)avpCode
{
    return 1420;
}

+ (uint32_t)avpCode
{
    return 1420;
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
    avpDef[@"name"] = @"cancellation-type";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

