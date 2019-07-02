//
//  UMDiameterAvpEvent_Timestamp.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:31:41.274000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEvent_Timestamp.h"

@implementation UMDiameterAvpEvent_Timestamp


- (NSString *)avpType
{
    return @"Event-Timestamp";
}

- (uint32_t)avpCode
{
    return 55;
}

+ (uint32_t)avpCode
{
    return 55;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

