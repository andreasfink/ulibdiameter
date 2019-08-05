//
//  UMDiameterAvpLoad_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.802000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoad_Type.h"

@implementation UMDiameterAvpLoad_Type


- (NSString *)avpType
{
    return @"Load-Type";
}

- (uint32_t)avpCode
{
    return 651;
}

+ (uint32_t)avpCode
{
    return 651;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

