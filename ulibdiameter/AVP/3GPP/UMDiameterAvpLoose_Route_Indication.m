//
//  UMDiameterAvpLoose_Route_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoose_Route_Indication.h"

@implementation UMDiameterAvpLoose_Route_Indication


- (NSString *)avpType
{
    return @"Loose-Route-Indication";
}

- (uint32_t)avpCode
{
    return 638;
}

+ (uint32_t)avpCode
{
    return 638;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

