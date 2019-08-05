//
//  UMDiameterAvpLoad_Value.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.802000
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

