//
//  UMDiameterAvpSequence_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSequence_Number.h"

@implementation UMDiameterAvpSequence_Number


- (NSString *)avpType
{
    return @"Sequence-Number";
}

- (uint32_t)avpCode
{
    return 716;
}

+ (uint32_t)avpCode
{
    return 716;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

