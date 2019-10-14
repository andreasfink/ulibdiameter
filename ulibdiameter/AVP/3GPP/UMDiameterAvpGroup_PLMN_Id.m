//
//  UMDiameterAvpGroup_PLMN_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGroup_PLMN_Id.h"

@implementation UMDiameterAvpGroup_PLMN_Id


- (NSString *)avpType
{
    return @"Group-PLMN-Id";
}

- (uint32_t)avpCode
{
    return 1677;
}

+ (uint32_t)avpCode
{
    return 1677;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

