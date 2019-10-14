//
//  UMDiameterAvpArea_Identification.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpArea_Identification.h"

@implementation UMDiameterAvpArea_Identification


- (NSString *)avpType
{
    return @"Area-Identification";
}

- (uint32_t)avpCode
{
    return 2537;
}

+ (uint32_t)avpCode
{
    return 2537;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

