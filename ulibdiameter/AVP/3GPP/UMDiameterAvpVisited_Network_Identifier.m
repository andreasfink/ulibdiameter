//
//  UMDiameterAvpVisited_Network_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVisited_Network_Identifier.h"

@implementation UMDiameterAvpVisited_Network_Identifier


- (NSString *)avpType
{
    return @"Visited-Network-Identifier";
}

- (uint32_t)avpCode
{
    return 600;
}

+ (uint32_t)avpCode
{
    return 600;
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
    avpDef[@"name"] = @"visited-network-identifier";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

