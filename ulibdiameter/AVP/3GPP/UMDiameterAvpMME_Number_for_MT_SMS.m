//
//  UMDiameterAvpMME_Number_for_MT_SMS.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMME_Number_for_MT_SMS.h"

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


@end

