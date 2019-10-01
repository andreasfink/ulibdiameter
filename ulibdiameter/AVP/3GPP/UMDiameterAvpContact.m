//
//  UMDiameterAvpContact.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpContact.h"

@implementation UMDiameterAvpContact


- (NSString *)avpType
{
    return @"Contact";
}

- (uint32_t)avpCode
{
    return 641;
}

+ (uint32_t)avpCode
{
    return 641;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

