//
//  UMDiameterAvpCSG_Access_Mode.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCSG_Access_Mode.h"

@implementation UMDiameterAvpCSG_Access_Mode


- (NSString *)avpType
{
    return @"CSG-Access-Mode";
}

- (uint32_t)avpCode
{
    return 2317;
}

+ (uint32_t)avpCode
{
    return 2317;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

