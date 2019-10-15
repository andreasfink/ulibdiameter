//
//  UMDiameterAvpSession_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSession_Priority.h"

@implementation UMDiameterAvpSession_Priority


- (NSString *)avpType
{
    return @"Session-Priority";
}

- (uint32_t)avpCode
{
    return 650;
}

+ (uint32_t)avpCode
{
    return 650;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

