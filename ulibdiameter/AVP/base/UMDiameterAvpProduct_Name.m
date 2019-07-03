//
//  UMDiameterAvpProduct_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
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
