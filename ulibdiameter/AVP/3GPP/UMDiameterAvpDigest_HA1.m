//
//  UMDiameterAvpDigest_HA1.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDigest_HA1.h"

@implementation UMDiameterAvpDigest_HA1


- (NSString *)avpType
{
    return @"Digest-HA1";
}

- (uint32_t)avpCode
{
    return 121;
}

+ (uint32_t)avpCode
{
    return 121;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"digest-ha1";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

