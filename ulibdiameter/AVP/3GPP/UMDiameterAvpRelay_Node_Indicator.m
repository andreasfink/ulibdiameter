//
//  UMDiameterAvpRelay_Node_Indicator.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.459000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRelay_Node_Indicator.h"

@implementation UMDiameterAvpRelay_Node_Indicator


- (NSString *)avpType
{
    return @"Relay-Node-Indicator";
}

- (uint32_t)avpCode
{
    return 1633;
}

+ (uint32_t)avpCode
{
    return 1633;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

