//
//  UMDiameterAvpCSG_Membership_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCSG_Membership_Indication.h"

@implementation UMDiameterAvpCSG_Membership_Indication


- (NSString *)avpType
{
    return @"CSG-Membership-Indication";
}

- (uint32_t)avpCode
{
    return 2318;
}

+ (uint32_t)avpCode
{
    return 2318;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

