//
//  UMDiameterAvpQoS_Resources.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpQoS_Resources.h"

@implementation UMDiameterAvpQoS_Resources


- (NSString *)avpType
{
    return @"QoS-Resources";
}

- (uint32_t)avpCode
{
    return 508;
}

+ (uint32_t)avpCode
{
    return 508;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

