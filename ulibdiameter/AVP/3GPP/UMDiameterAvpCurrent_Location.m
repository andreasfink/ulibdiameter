//
//  UMDiameterAvpCurrent_Location.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCurrent_Location.h"

@implementation UMDiameterAvpCurrent_Location


- (NSString *)avpType
{
    return @"Current-Location";
}

- (uint32_t)avpCode
{
    return 707;
}

+ (uint32_t)avpCode
{
    return 707;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

