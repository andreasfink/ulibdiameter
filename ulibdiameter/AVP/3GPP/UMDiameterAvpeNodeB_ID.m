//
//  UMDiameterAvpeNodeB_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpeNodeB_ID.h"

@implementation UMDiameterAvpeNodeB_ID


- (NSString *)avpType
{
    return @"eNodeB-ID";
}

- (uint32_t)avpCode
{
    return 4008;
}

+ (uint32_t)avpCode
{
    return 4008;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

