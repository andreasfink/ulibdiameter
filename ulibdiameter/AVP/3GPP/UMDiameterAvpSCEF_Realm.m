//
//  UMDiameterAvpSCEF_Realm.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDiameterIdentity.h"

@implementation UMDiameterAvpSCEF_Realm


- (NSString *)avpType
{
    return @"SCEF-Realm";
}

- (uint32_t)avpCode
{
    return 1684;
}

+ (uint32_t)avpCode
{
    return 1684;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

