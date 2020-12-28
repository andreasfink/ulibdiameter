//
//  UMDiameterAvpMIP_Careof_Address.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:28.084823
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
    /* _vendorFlag = NO, _vendorCode = 0 */
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

