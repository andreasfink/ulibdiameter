//
//  UMDiameterAvpSIPTO_Local_Network_Permission.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIPTO_Local_Network_Permission.h"

@implementation UMDiameterAvpSIPTO_Local_Network_Permission


- (NSString *)avpType
{
    return @"SIPTO-Local-Network-Permission";
}

- (uint32_t)avpCode
{
    return 1665;
}

+ (uint32_t)avpCode
{
    return 1665;
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
    avpDef[@"name"] = @"sipto-local-network-permission";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

