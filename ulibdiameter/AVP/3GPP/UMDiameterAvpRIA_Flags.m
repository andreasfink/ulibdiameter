//
//  UMDiameterAvpRIA_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRIA_Flags.h"

@implementation UMDiameterAvpRIA_Flags


- (NSString *)avpType
{
    return @"RIA-Flags";
}

- (uint32_t)avpCode
{
    return 2411;
}

+ (uint32_t)avpCode
{
    return 2411;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

