//
//  UMDiameterAvpMax_Supported_Bandwidth_UL.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMax_Supported_Bandwidth_UL.h"

@implementation UMDiameterAvpMax_Supported_Bandwidth_UL


- (NSString *)avpType
{
    return @"Max-Supported-Bandwidth-UL";
}

- (uint32_t)avpCode
{
    return 544;
}

+ (uint32_t)avpCode
{
    return 544;
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
    avpDef[@"name"] = @"max-supported-bandwidth-ul";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

