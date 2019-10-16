//
//  UMDiameterAvpMIP_Mobile_Node_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.128000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Mobile_Node_Address.h"

@implementation UMDiameterAvpMIP_Mobile_Node_Address


- (NSString *)avpType
{
    return @"MIP-Mobile-Node-Address";
}

- (uint32_t)avpCode
{
    return 333;
}

+ (uint32_t)avpCode
{
    return 333;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip-mobile-node-address";
    avpDef[@"type"] = @"Address";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

