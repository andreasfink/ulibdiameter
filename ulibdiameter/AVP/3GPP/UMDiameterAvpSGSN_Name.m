//
//  UMDiameterAvpSGSN_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSGSN_Name.h"

@implementation UMDiameterAvpSGSN_Name


- (NSString *)avpType
{
    return @"SGSN-Name";
}

- (uint32_t)avpCode
{
    return 2409;
}

+ (uint32_t)avpCode
{
    return 2409;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

