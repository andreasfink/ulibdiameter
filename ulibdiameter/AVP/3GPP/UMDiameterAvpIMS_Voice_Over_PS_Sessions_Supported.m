//
//  UMDiameterAvpIMS_Voice_Over_PS_Sessions_Supported.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

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


@end

