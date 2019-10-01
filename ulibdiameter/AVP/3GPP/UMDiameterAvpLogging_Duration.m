//
//  UMDiameterAvpLogging_Duration.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLogging_Duration.h"

@implementation UMDiameterAvpLogging_Duration


- (NSString *)avpType
{
    return @"Logging-Duration";
}

- (uint32_t)avpCode
{
    return 1632;
}

+ (uint32_t)avpCode
{
    return 1632;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

