//
//  UMDiameterAvpExpiration_Date.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExpiration_Date.h"

@implementation UMDiameterAvpExpiration_Date


- (NSString *)avpType
{
    return @"Expiration-Date";
}

- (uint32_t)avpCode
{
    return 1439;
}

+ (uint32_t)avpCode
{
    return 1439;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

