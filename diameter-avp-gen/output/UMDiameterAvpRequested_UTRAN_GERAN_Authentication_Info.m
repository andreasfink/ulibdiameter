//
//  UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info


- (NSString *)avpType
{
    return @"Requested-UTRAN-GERAN-Authentication-Info";
}

- (uint32_t)avpCode
{
    return 1409;
}

+ (uint32_t)avpCode
{
    return 1409;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

