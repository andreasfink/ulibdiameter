//
//  UMDiameterAvp1xRTT_RCID.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvp1xRTT_RCID.h"

@implementation UMDiameterAvp1xRTT_RCID


- (NSString *)avpType
{
    return @"1xRTT-RCID";
}

- (uint32_t)avpCode
{
    return 2554;
}

+ (uint32_t)avpCode
{
    return 2554;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"1xrtt-rcid";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

