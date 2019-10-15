//
//  UMDiameterAvpSubs_Req_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubs_Req_Type.h"

@implementation UMDiameterAvpSubs_Req_Type


- (NSString *)avpType
{
    return @"Subs-Req-Type";
}

- (uint32_t)avpCode
{
    return 705;
}

+ (uint32_t)avpCode
{
    return 705;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

