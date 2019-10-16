//
//  UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions.h"

@implementation UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions


- (NSString *)avpType
{
    return @"Homogeneous-Support-of-IMS-Voice-Over-PS-Sessions";
}

- (uint32_t)avpCode
{
    return 1493;
}

+ (uint32_t)avpCode
{
    return 1493;
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
    avpDef[@"name"] = @"homogeneous-support-of-ims-voice-over-ps-sessions";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

