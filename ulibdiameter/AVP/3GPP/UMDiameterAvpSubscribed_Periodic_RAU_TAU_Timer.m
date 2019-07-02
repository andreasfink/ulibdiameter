//
//  UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer.h"

@implementation UMDiameterAvpSubscribed_Periodic_RAU_TAU_Timer


- (NSString *)avpType
{
    return @"Subscribed-Periodic-RAU-TAU-Timer";
}

- (uint32_t)avpCode
{
    return 1619;
}

+ (uint32_t)avpCode
{
    return 1619;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

