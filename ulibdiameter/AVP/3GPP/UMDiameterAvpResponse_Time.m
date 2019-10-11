//
//  UMDiameterAvpResponse_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpResponse_Time.h"

@implementation UMDiameterAvpResponse_Time


- (NSString *)avpType
{
    return @"Response-Time";
}

- (uint32_t)avpCode
{
    return 2509;
}

+ (uint32_t)avpCode
{
    return 2509;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

