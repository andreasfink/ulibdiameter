//
//  UMDiameterAvpAuth_Grace_Period.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAuth_Grace_Period.h"

@implementation UMDiameterAvpAuth_Grace_Period


- (NSString *)avpType
{
    return @"Auth-Grace-Period";
}

- (uint32_t)avpCode
{
    return 276;
}

+ (uint32_t)avpCode
{
    return 276;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

