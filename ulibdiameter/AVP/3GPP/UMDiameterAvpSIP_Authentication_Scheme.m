//
//  UMDiameterAvpSIP_Authentication_Scheme.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Authentication_Scheme.h"

@implementation UMDiameterAvpSIP_Authentication_Scheme


- (NSString *)avpType
{
    return @"SIP-Authentication-Scheme";
}

- (uint32_t)avpCode
{
    return 608;
}

+ (uint32_t)avpCode
{
    return 608;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

