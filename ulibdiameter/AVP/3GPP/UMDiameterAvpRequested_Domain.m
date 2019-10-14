//
//  UMDiameterAvpRequested_Domain.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRequested_Domain.h"

@implementation UMDiameterAvpRequested_Domain


- (NSString *)avpType
{
    return @"Requested-Domain";
}

- (uint32_t)avpCode
{
    return 706;
}

+ (uint32_t)avpCode
{
    return 706;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

