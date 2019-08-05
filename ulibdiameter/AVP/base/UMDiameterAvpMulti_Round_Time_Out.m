//
//  UMDiameterAvpMulti_Round_Time_Out.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.427000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMulti_Round_Time_Out.h"

@implementation UMDiameterAvpMulti_Round_Time_Out


- (NSString *)avpType
{
    return @"Multi-Round-Time-Out";
}

- (uint32_t)avpCode
{
    return 272;
}

+ (uint32_t)avpCode
{
    return 272;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

