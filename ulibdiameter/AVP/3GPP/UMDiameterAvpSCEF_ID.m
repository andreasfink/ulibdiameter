//
//  UMDiameterAvpSCEF_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCEF_ID.h"

@implementation UMDiameterAvpSCEF_ID


- (NSString *)avpType
{
    return @"SCEF-ID";
}

- (uint32_t)avpCode
{
    return 3125;
}

+ (uint32_t)avpCode
{
    return 3125;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

