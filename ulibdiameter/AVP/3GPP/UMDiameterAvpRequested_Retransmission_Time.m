//
//  UMDiameterAvpRequested_Retransmission_Time.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRequested_Retransmission_Time.h"

@implementation UMDiameterAvpRequested_Retransmission_Time


- (NSString *)avpType
{
    return @"Requested-Retransmission-Time";
}

- (uint32_t)avpCode
{
    return 3331;
}

+ (uint32_t)avpCode
{
    return 3331;
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
    avpDef[@"name"] = @"requested-retransmission-time";
    avpDef[@"type"] = @"Time";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

