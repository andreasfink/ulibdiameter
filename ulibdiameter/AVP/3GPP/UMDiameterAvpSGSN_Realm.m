//
//  UMDiameterAvpSGSN_Realm.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSGSN_Realm.h"

@implementation UMDiameterAvpSGSN_Realm


- (NSString *)avpType
{
    return @"SGSN-Realm";
}

- (uint32_t)avpCode
{
    return 2410;
}

+ (uint32_t)avpCode
{
    return 2410;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

