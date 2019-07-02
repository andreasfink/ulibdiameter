//
//  UMDiameterAvpAdditional_Context_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAdditional_Context_ID.h"

@implementation UMDiameterAvpAdditional_Context_ID


- (NSString *)avpType
{
    return @"Additional-Context-ID";
}

- (uint32_t)avpCode
{
    return 1683;
}

+ (uint32_t)avpCode
{
    return 1683;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

