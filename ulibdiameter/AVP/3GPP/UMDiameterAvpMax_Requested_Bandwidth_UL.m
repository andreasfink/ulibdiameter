//
//  UMDiameterAvpMax_Requested_Bandwidth_UL.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMax_Requested_Bandwidth_UL.h"

@implementation UMDiameterAvpMax_Requested_Bandwidth_UL


- (NSString *)avpType
{
    return @"Max-Requested-Bandwidth-UL";
}

- (uint32_t)avpCode
{
    return 516;
}

+ (uint32_t)avpCode
{
    return 516;
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
    avpDef[@"name"] = @"max-requested-bandwidth-ul";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

