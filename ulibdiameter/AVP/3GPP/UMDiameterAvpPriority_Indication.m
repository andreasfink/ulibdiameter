//
//  UMDiameterAvpPriority_Indication.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:31:27.211657
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPriority_Indication.h"

@implementation UMDiameterAvpPriority_Indication


- (NSString *)avpType
{
    return @"Priority-Indication";
}

- (uint32_t)avpCode
{
    return 3006;
}

+ (uint32_t)avpCode
{
    return 3006;
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
    avpDef[@"name"] = @"priority-indication";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

