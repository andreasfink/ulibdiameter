//
//  UMDiameterAvpMIP_Replay_Mode.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:28.084823
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Replay_Mode.h"

@implementation UMDiameterAvpMIP_Replay_Mode


- (NSString *)avpType
{
    return @"MIP-Replay-Mode";
}

- (uint32_t)avpCode
{
    return 346;
}

+ (uint32_t)avpCode
{
    return 346;
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
    avpDef[@"name"] = @"mip-replay-mode";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

