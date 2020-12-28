//
//  UMDiameterAvpWildcarded_IMPU.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWildcarded_IMPU.h"

@implementation UMDiameterAvpWildcarded_IMPU


- (NSString *)avpType
{
    return @"Wildcarded-IMPU";
}

- (uint32_t)avpCode
{
    return 636;
}

+ (uint32_t)avpCode
{
    return 636;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = YES, _vendorCode = 10415 */
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"wildcarded-impu";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

