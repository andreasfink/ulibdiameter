//
//  UMDiameterAvpLoad_Value.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:50:53.129000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoad_Value.h"

@implementation UMDiameterAvpLoad_Value


- (NSString *)avpType
{
    return @"Load-Value";
}

- (uint32_t)avpCode
{
    return 652;
}

+ (uint32_t)avpCode
{
    return 652;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

