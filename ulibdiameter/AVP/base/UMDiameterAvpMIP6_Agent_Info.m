//
//  UMDiameterAvpMIP6_Agent_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:49:36.549000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"

@implementation UMDiameterAvpMIP6_Agent_Info


- (NSString *)avpType
{
    return @"MIP6-Agent-Info";
}

- (uint32_t)avpCode
{
    return 486;
}

+ (uint32_t)avpCode
{
    return 486;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

