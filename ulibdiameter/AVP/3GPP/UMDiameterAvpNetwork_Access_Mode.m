//
//  UMDiameterAvpNetwork_Access_Mode.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNetwork_Access_Mode.h"

@implementation UMDiameterAvpNetwork_Access_Mode


- (NSString *)avpType
{
    return @"Network-Access-Mode";
}

- (uint32_t)avpCode
{
    return 1417;
}

+ (uint32_t)avpCode
{
    return 1417;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

