//
//  UMDiameterAvpIDR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIDR_Flags.h"

@implementation UMDiameterAvpIDR_Flags


- (NSString *)avpType
{
    return @"IDR-Flags";
}

- (uint32_t)avpCode
{
    return 1490;
}

+ (uint32_t)avpCode
{
    return 1490;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory | UMDiameterAvpFlag_Vendor;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"idr-flags";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

