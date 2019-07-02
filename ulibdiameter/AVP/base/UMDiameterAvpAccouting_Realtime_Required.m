//
//  UMDiameterAvpAccouting_Realtime_Required.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:26.522000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccouting_Realtime_Required.h"

@implementation UMDiameterAvpAccouting_Realtime_Required


- (NSString *)avpType
{
    return @"Accouting-Realtime-Required";
}

- (uint32_t)avpCode
{
    return 483;
}

+ (uint32_t)avpCode
{
    return 483;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

