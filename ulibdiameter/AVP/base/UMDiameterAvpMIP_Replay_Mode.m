//
//  UMDiameterAvpMIP_Replay_Mode.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
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
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end
