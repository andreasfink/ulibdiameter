//
//  UMDiameterAvpMultiple_Registration_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMultiple_Registration_Indication.h"

@implementation UMDiameterAvpMultiple_Registration_Indication


- (NSString *)avpType
{
    return @"Multiple-Registration-Indication";
}

- (uint32_t)avpCode
{
    return 648;
}

+ (uint32_t)avpCode
{
    return 648;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

