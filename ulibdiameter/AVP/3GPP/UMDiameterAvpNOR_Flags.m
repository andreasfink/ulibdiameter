//
//  UMDiameterAvpNOR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNOR_Flags.h"

@implementation UMDiameterAvpNOR_Flags


- (NSString *)avpType
{
    return @"NOR-Flags";
}

- (uint32_t)avpCode
{
    return 1443;
}

+ (uint32_t)avpCode
{
    return 1443;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

