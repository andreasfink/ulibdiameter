//
//  UMDiameterAvpLocal_Time_Zone_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocal_Time_Zone_Indication.h"

@implementation UMDiameterAvpLocal_Time_Zone_Indication


- (NSString *)avpType
{
    return @"Local-Time-Zone-Indication";
}

- (uint32_t)avpCode
{
    return 718;
}

+ (uint32_t)avpCode
{
    return 718;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

