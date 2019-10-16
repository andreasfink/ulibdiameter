//
//  UMDiameterAvpMIP_MAC_Mobility_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:20.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_MAC_Mobility_Data.h"

@implementation UMDiameterAvpMIP_MAC_Mobility_Data


- (NSString *)avpType
{
    return @"MIP-MAC-Mobility-Data";
}

- (uint32_t)avpCode
{
    return 489;
}

+ (uint32_t)avpCode
{
    return 489;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip-mac-mobility-data";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

