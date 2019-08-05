//
//  UMDiameterAvpLoad_Value.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:46.030000
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

