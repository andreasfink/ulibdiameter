//
//  UMDiameterAvpIntegrity_Key.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIntegrity_Key.h"

@implementation UMDiameterAvpIntegrity_Key


- (NSString *)avpType
{
    return @"Integrity-Key";
}

- (uint32_t)avpCode
{
    return 626;
}

+ (uint32_t)avpCode
{
    return 626;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

