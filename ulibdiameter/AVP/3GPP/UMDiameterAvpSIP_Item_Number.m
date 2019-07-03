//
//  UMDiameterAvpSIP_Item_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Item_Number.h"

@implementation UMDiameterAvpSIP_Item_Number


- (NSString *)avpType
{
    return @"SIP-Item-Number";
}

- (uint32_t)avpCode
{
    return 613;
}

+ (uint32_t)avpCode
{
    return 613;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

