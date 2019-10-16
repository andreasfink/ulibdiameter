//
//  UMDiameterAvpMIP_Careof_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:20.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Careof_Address.h"

@implementation UMDiameterAvpMIP_Careof_Address


- (NSString *)avpType
{
    return @"MIP-Careof-Address";
}

- (uint32_t)avpCode
{
    return 487;
}

+ (uint32_t)avpCode
{
    return 487;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip-careof-address";
    avpDef[@"type"] = @"Address";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

