//
//  UMDiameterAvpLRA_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLRA_Flags.h"

@implementation UMDiameterAvpLRA_Flags


- (NSString *)avpType
{
    return @"LRA-Flags";
}

- (uint32_t)avpCode
{
    return 2549;
}

+ (uint32_t)avpCode
{
    return 2549;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

