//
//  UMDiameterAvpLCS_Privacy_Check.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Privacy_Check.h"

@implementation UMDiameterAvpLCS_Privacy_Check


- (NSString *)avpType
{
    return @"LCS-Privacy-Check";
}

- (uint32_t)avpCode
{
    return 2512;
}

+ (uint32_t)avpCode
{
    return 2512;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

