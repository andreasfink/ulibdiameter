//
//  UMDiameterAvpMIP_Mobile_Node_Address.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpMIP_Mobile_Node_Address.h>

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

