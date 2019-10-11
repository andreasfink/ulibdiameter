//
//  UMDiameterAvpRequested_Nodes.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRequested_Nodes.h"

@implementation UMDiameterAvpRequested_Nodes


- (NSString *)avpType
{
    return @"Requested-Nodes";
}

- (uint32_t)avpCode
{
    return 713;
}

+ (uint32_t)avpCode
{
    return 713;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end
