//
//  UMDiameterAvpJob_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpJob_Type.h"

@implementation UMDiameterAvpJob_Type


- (NSString *)avpType
{
    return @"Job-Type";
}

- (uint32_t)avpCode
{
    return 1623;
}

+ (uint32_t)avpCode
{
    return 1623;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

