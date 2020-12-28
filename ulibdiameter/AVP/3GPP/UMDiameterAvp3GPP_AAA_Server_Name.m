//
//  UMDiameterAvp3GPP_AAA_Server_Name.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvp3GPP_AAA_Server_Name.h"

@implementation UMDiameterAvp3GPP_AAA_Server_Name


- (NSString *)avpType
{
    return @"3GPP-AAA-Server-Name";
}

- (uint32_t)avpCode
{
    return 318;
}

+ (uint32_t)avpCode
{
    return 318;
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
    avpDef[@"name"] = @"3gpp-aaa-server-name";
    avpDef[@"type"] = @"DiameterIdentity";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

