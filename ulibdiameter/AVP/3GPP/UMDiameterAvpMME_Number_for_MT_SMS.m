//
//  UMDiameterAvpMME_Number_for_MT_SMS.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpMME_Number_for_MT_SMS


- (NSString *)avpType
{
    return @"MME-Number-for-MT-SMS";
}

- (uint32_t)avpCode
{
    return 1645;
}

+ (uint32_t)avpCode
{
    return 1645;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

