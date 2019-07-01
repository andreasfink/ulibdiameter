//
//  UMDiameterAvpPreferred_Data_Mode.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpPreferred_Data_Mode


- (NSString *)avpType
{
    return @"Preferred-Data-Mode";
}

- (uint32_t)avpCode
{
    return 1686;
}

+ (uint32_t)avpCode
{
    return 1686;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

