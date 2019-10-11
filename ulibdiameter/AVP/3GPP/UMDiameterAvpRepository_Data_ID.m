//
//  UMDiameterAvpRepository_Data_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRepository_Data_ID.h"

@implementation UMDiameterAvpRepository_Data_ID


- (NSString *)avpType
{
    return @"Repository-Data-ID ";
}

- (uint32_t)avpCode
{
    return 715;
}

+ (uint32_t)avpCode
{
    return 715;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

