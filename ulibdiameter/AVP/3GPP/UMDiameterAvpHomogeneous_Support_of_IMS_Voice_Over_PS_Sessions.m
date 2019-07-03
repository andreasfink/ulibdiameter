//
//  UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
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


@end
