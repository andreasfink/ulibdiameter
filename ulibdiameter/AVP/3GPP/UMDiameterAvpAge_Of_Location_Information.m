//
//  UMDiameterAvpAge_Of_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAge_Of_Location_Information.h"

@implementation UMDiameterAvpAge_Of_Location_Information


- (NSString *)avpType
{
    return @"Age-Of-Location-Information";
}

- (uint32_t)avpCode
{
    return 1611;
}

+ (uint32_t)avpCode
{
    return 1611;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

