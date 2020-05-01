//
//  UMDiameterAvpOriginating_SIP_URI.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOriginating_SIP_URI.h"

@implementation UMDiameterAvpOriginating_SIP_URI


- (NSString *)avpType
{
    return @"Originating-SIP-URI";
}

- (uint32_t)avpCode
{
    return 3326;
}

+ (uint32_t)avpCode
{
    return 3326;
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
    avpDef[@"name"] = @"originating-sip-uri";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

