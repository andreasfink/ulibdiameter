//
//  UMDiameterAvpServing_Node_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServing_Node_Indication.h"

@implementation UMDiameterAvpServing_Node_Indication


- (NSString *)avpType
{
    return @"Serving-Node-Indication";
}

- (uint32_t)avpCode
{
    return 714;
}

+ (uint32_t)avpCode
{
    return 714;
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
    avpDef[@"name"] = @"serving-node-indication";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

