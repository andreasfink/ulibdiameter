//
//  UMDiameterAvpNumber_Of_Requested_Vectors.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNumber_Of_Requested_Vectors.h"

@implementation UMDiameterAvpNumber_Of_Requested_Vectors


- (NSString *)avpType
{
    return @"Number-Of-Requested-Vectors";
}

- (uint32_t)avpCode
{
    return 1410;
}

+ (uint32_t)avpCode
{
    return 1410;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

