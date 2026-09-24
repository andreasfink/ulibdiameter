//
//  UMDiameterAvpLCS_Reference_Number.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvp.h>
#import <ulibdiameter/AVP/3GPP/UMDiameterAvpLCS_Reference_Number.h>

@implementation UMDiameterAvpLCS_Reference_Number


- (NSString *)avpType
{
    return @"LCS-Reference-Number";
}

- (uint32_t)avpCode
{
    return 2531;
}

+ (uint32_t)avpCode
{
    return 2531;
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
    avpDef[@"name"] = @"lcs-reference-number";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

