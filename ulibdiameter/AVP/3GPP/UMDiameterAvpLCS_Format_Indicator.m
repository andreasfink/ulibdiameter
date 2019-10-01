//
//  UMDiameterAvpLCS_Format_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Format_Indicator.h"

@implementation UMDiameterAvpLCS_Format_Indicator


- (NSString *)avpType
{
    return @"LCS-Format-Indicator";
}

- (uint32_t)avpCode
{
    return 1237;
}

+ (uint32_t)avpCode
{
    return 1237;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

