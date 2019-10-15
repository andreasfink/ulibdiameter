//
//  UMDiameterAvpExtended_Max_Requested_BW_UL.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExtended_Max_Requested_BW_UL.h"

@implementation UMDiameterAvpExtended_Max_Requested_BW_UL


- (NSString *)avpType
{
    return @"Extended-Max-Requested-BW-UL";
}

- (uint32_t)avpCode
{
    return 555;
}

+ (uint32_t)avpCode
{
    return 555;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

