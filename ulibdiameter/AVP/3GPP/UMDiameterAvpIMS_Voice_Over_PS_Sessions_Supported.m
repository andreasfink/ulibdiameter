//
//  UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported.h>

@implementation UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported


- (NSString *)avpType
{
    return @"IMS-Voice-Over-PS-Sessions-Supported";
}

- (uint32_t)avpCode
{
    return 1492;
}

+ (uint32_t)avpCode
{
    return 1492;
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
    avpDef[@"name"] = @"ims-voice-over-ps-sessions-supported";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

