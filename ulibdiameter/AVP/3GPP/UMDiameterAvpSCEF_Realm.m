//
//  UMDiameterAvpSCEF_Realm.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCEF_Realm.h"

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


@end

