//
//  UMDiameterAvpHost_IP_Address.m
//  ulibdiameter
//
//  Created by afink on 2020-12-24 14:13:32.336902
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpHost_IP_Address.h"

@implementation UMDiameterAvpHost_IP_Address


- (NSString *)avpType
{
    return @"Host-IP-Address";
}

- (uint32_t)avpCode
{
    return 257;
}

+ (uint32_t)avpCode
{
    return 257;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"host-ip-address";
    avpDef[@"type"] = @"Address";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

