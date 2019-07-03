//
//  UMDiameterAvpLoad_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 09:50:12.653000
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
