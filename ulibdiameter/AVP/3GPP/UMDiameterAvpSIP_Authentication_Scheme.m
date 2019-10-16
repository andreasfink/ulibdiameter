//
//  UMDiameterAvpSIP_Authentication_Scheme.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Authentication_Scheme.h"

@implementation UMDiameterAvpSIP_Authentication_Scheme


- (NSString *)avpType
{
    return @"SIP-Authentication-Scheme";
}

- (uint32_t)avpCode
{
    return 608;
}

+ (uint32_t)avpCode
{
    return 608;
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
    avpDef[@"name"] = @"sip-authentication-scheme";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

