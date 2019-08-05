//
//  UMDiameterAvpSIP_Authentication_Context.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Authentication_Context.h"

@implementation UMDiameterAvpSIP_Authentication_Context


- (NSString *)avpType
{
    return @"SIP-Authentication-Context";
}

- (uint32_t)avpCode
{
    return 611;
}

+ (uint32_t)avpCode
{
    return 611;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

