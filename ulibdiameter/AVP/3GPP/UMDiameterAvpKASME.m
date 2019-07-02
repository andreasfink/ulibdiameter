//
//  UMDiameterAvpKASME.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpKASME.h"

@implementation UMDiameterAvpKASME


- (NSString *)avpType
{
    return @"KASME";
}

- (uint32_t)avpCode
{
    return 1450;
}

+ (uint32_t)avpCode
{
    return 1450;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

