//
//  UMDiameterAvpOne_Time_Notification.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOne_Time_Notification.h"

@implementation UMDiameterAvpOne_Time_Notification


- (NSString *)avpType
{
    return @"One-Time-Notification";
}

- (uint32_t)avpCode
{
    return 712;
}

+ (uint32_t)avpCode
{
    return 712;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

