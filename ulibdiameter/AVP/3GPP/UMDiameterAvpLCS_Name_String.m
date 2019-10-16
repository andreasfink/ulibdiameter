//
//  UMDiameterAvpLCS_Name_String.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Name_String.h"

@implementation UMDiameterAvpLCS_Name_String


- (NSString *)avpType
{
    return @"LCS-Name-String";
}

- (uint32_t)avpCode
{
    return 1238;
}

+ (uint32_t)avpCode
{
    return 1238;
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
    avpDef[@"name"] = @"lcs-name-string";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

