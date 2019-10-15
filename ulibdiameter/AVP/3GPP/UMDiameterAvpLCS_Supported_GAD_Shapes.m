//
//  UMDiameterAvpLCS_Supported_GAD_Shapes.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
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


@end

