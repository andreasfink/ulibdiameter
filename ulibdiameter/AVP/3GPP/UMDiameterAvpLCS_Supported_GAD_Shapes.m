//
//  UMDiameterAvpLCS_Supported_GAD_Shapes.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Supported_GAD_Shapes.h"

@implementation UMDiameterAvpLCS_Supported_GAD_Shapes


- (NSString *)avpType
{
    return @"LCS-Supported-GAD-Shapes";
}

- (uint32_t)avpCode
{
    return 2510;
}

+ (uint32_t)avpCode
{
    return 2510;
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
    avpDef[@"name"] = @"lcs-supported-gad-shapes";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

