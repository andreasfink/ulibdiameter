//
//  UMDiameterAvpInitial_CSeq_Sequence_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"initial_cseq_sequence_number";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

