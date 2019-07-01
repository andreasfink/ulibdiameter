//
//  UMDiameterAvpProduct_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpProduct_Name.h"

@implementation UMDiameterAvpProduct_Name


- (NSString *)avpType
{
    return @"Product-Name";
}

- (uint32_t)avpCode
{
    return 269;
}

+ (uint32_t)avpCode
{
    return 269;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

