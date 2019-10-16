//
//  UMDiameterAvpeDRX_Cycle_Length_Value.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpeDRX_Cycle_Length_Value.h"

@implementation UMDiameterAvpeDRX_Cycle_Length_Value


- (NSString *)avpType
{
    return @"eDRX-Cycle-Length-Value";
}

- (uint32_t)avpCode
{
    return 1692;
}

+ (uint32_t)avpCode
{
    return 1692;
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
    avpDef[@"name"] = @"edrx-cycle-length-value";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

