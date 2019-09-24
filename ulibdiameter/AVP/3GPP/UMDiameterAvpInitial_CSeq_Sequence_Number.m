//
//  UMDiameterAvpInitial_CSeq_Sequence_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpInitial_CSeq_Sequence_Number.h"

@implementation UMDiameterAvpInitial_CSeq_Sequence_Number


- (NSString *)avpType
{
    return @"Initial_CSeq_Sequence_Number";
}

- (uint32_t)avpCode
{
    return 654;
}

+ (uint32_t)avpCode
{
    return 654;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

