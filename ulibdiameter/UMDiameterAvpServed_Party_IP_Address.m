//
//  UMDiameterAvpServed_Party_IP_Address.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpServed_Party_IP_Address.h>

@implementation UMDiameterAvpServed_Party_IP_Address


- (NSString *)avpType
{
    return @"Served-Party-IP-Address";
}

- (uint32_t)avpCode
{
    return 848;
}

+ (uint32_t)avpCode
{
    return 848;
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
    avpDef[@"name"] = @"served-party-ip-address";
    avpDef[@"type"] = @"Address";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

