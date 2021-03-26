//
//  UMDiameterAvpSCS_Identity.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:21:03.403903
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCS_Identity.h"

@implementation UMDiameterAvpSCS_Identity


- (NSString *)avpType
{
    return @"SCS-Identity";
}

- (uint32_t)avpCode
{
    return 3104;
}

+ (uint32_t)avpCode
{
    return 3104;
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
    avpDef[@"name"] = @"scs-identity";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

