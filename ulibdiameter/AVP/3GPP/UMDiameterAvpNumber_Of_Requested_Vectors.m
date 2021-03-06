//
//  UMDiameterAvpNumber_Of_Requested_Vectors.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNumber_Of_Requested_Vectors.h"

@implementation UMDiameterAvpNumber_Of_Requested_Vectors


- (NSString *)avpType
{
    return @"Number-Of-Requested-Vectors";
}

- (uint32_t)avpCode
{
    return 1410;
}

+ (uint32_t)avpCode
{
    return 1410;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"number-of-requested-vectors";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

