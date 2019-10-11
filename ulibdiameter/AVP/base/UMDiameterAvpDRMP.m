//
//  UMDiameterAvpDRMP.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:28.749000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDRMP.h"

@implementation UMDiameterAvpDRMP


- (NSString *)avpType
{
    return @"DRMP";
}

- (uint32_t)avpCode
{
    return 301;
}

+ (uint32_t)avpCode
{
    return 301;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

