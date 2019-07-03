//
//  UMDiameterAvpPLMN_Client.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPLMN_Client.h"

@implementation UMDiameterAvpPLMN_Client


- (NSString *)avpType
{
    return @"PLMN-Client";
}

- (uint32_t)avpCode
{
    return 1482;
}

+ (uint32_t)avpCode
{
    return 1482;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

