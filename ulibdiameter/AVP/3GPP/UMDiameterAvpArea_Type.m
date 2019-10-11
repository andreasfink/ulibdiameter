//
//  UMDiameterAvpArea_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpArea_Type.h"

@implementation UMDiameterAvpArea_Type


- (NSString *)avpType
{
    return @"Area-Type";
}

- (uint32_t)avpCode
{
    return 2536;
}

+ (uint32_t)avpCode
{
    return 2536;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

