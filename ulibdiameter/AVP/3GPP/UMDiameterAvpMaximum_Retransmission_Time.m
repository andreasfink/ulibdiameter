//
//  UMDiameterAvpMaximum_Retransmission_Time.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMaximum_Retransmission_Time.h"

@implementation UMDiameterAvpMaximum_Retransmission_Time


- (NSString *)avpType
{
    return @"Maximum-Retransmission-Time";
}

- (uint32_t)avpCode
{
    return 3330;
}

+ (uint32_t)avpCode
{
    return 3330;
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
    avpDef[@"name"] = @"maximum-retransmission-time";
    avpDef[@"type"] = @"Time";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

