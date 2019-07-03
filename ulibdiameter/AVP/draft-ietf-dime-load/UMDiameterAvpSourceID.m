//
//  UMDiameterAvpSourceID.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:50:53.129000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSourceID.h"

@implementation UMDiameterAvpSourceID


- (NSString *)avpType
{
    return @"SourceID";
}

- (uint32_t)avpCode
{
    return 649;
}

+ (uint32_t)avpCode
{
    return 649;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

