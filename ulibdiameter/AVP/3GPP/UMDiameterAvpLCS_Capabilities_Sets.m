//
//  UMDiameterAvpLCS_Capabilities_Sets.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Capabilities_Sets.h"

@implementation UMDiameterAvpLCS_Capabilities_Sets


- (NSString *)avpType
{
    return @"LCS-Capabilities-Sets";
}

- (uint32_t)avpCode
{
    return 2404;
}

+ (uint32_t)avpCode
{
    return 2404;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

