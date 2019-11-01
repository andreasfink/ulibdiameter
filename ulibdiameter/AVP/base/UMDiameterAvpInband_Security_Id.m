//
//  UMDiameterAvpInband_Security_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpInband_Security_Id.h"

@implementation UMDiameterAvpInband_Security_Id


- (NSString *)avpType
{
    return @"Inband-Security-Id";
}

- (uint32_t)avpCode
{
    return 299;
}

+ (uint32_t)avpCode
{
    return 299;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"inband-security-id";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

