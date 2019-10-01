//
//  UMDiameterAvpAUTN.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAUTN.h"

@implementation UMDiameterAvpAUTN


- (NSString *)avpType
{
    return @"AUTN";
}

- (uint32_t)avpCode
{
    return 1449;
}

+ (uint32_t)avpCode
{
    return 1449;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

