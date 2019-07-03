//
//  UMDiameterAvpHPLMN_ODB.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpHPLMN_ODB.h"

@implementation UMDiameterAvpHPLMN_ODB


- (NSString *)avpType
{
    return @"HPLMN-ODB";
}

- (uint32_t)avpCode
{
    return 1418;
}

+ (uint32_t)avpCode
{
    return 1418;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end
