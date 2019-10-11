//
//  UMDiameterAvpPDN_Connection_Continuity.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPDN_Connection_Continuity.h"

@implementation UMDiameterAvpPDN_Connection_Continuity


- (NSString *)avpType
{
    return @"PDN-Connection-Continuity";
}

- (uint32_t)avpCode
{
    return 1690;
}

+ (uint32_t)avpCode
{
    return 1690;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

