//
//  UMDiameterAvpSubscriber_Status.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscriber_Status.h"

@implementation UMDiameterAvpSubscriber_Status


- (NSString *)avpType
{
    return @"Subscriber-Status";
}

- (uint32_t)avpCode
{
    return 1424;
}

+ (uint32_t)avpCode
{
    return 1424;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

