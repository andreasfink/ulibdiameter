//
//  UMDiameterAvpQoS_Profile_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpQoS_Profile_Id.h"

@implementation UMDiameterAvpQoS_Profile_Id


- (NSString *)avpType
{
    return @"QoS-Profile-Id";
}

- (uint32_t)avpCode
{
    return 573;
}

+ (uint32_t)avpCode
{
    return 573;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end
