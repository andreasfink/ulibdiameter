//
//  UMDiameterAvpVisited_PLMN_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"

@implementation UMDiameterAvpVisited_PLMN_Id


- (NSString *)avpType
{
    return @"Visited-PLMN-Id";
}

- (uint32_t)avpCode
{
    return 1407;
}

+ (uint32_t)avpCode
{
    return 1407;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

