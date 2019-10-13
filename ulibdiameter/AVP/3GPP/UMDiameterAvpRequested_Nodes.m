//
//  UMDiameterAvpRequested_Nodes.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
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

