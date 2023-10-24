//
//  UMDiameterAvpWildcarded_Public_Identity.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWildcarded_Public_Identity.h"

@implementation UMDiameterAvpWildcarded_Public_Identity


- (NSString *)avpType
{
    return @"Wildcarded-Public-Identity";
}

- (uint32_t)avpCode
{
    return 634;
}

+ (uint32_t)avpCode
{
    return 634;
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
    avpDef[@"name"] = @"wildcarded-public-identity";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

