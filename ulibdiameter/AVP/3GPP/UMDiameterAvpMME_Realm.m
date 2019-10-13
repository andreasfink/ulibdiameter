//
//  UMDiameterAvpMME_Realm.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMME_Realm.h"

@implementation UMDiameterAvpMME_Realm


- (NSString *)avpType
{
    return @"MME-Realm";
}

- (uint32_t)avpCode
{
    return 2408;
}

+ (uint32_t)avpCode
{
    return 2408;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

