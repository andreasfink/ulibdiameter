//
//  UMDiameterAvpOMC_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOMC_Id.h"

@implementation UMDiameterAvpOMC_Id


- (NSString *)avpType
{
    return @"OMC-Id";
}

- (uint32_t)avpCode
{
    return 1466;
}

+ (uint32_t)avpCode
{
    return 1466;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

