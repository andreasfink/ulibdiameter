//
//  UMDiameterAvpExtended_Max_Requested_BW_DL.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.400000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExtended_Max_Requested_BW_DL.h"

@implementation UMDiameterAvpExtended_Max_Requested_BW_DL


- (NSString *)avpType
{
    return @"Extended-Max-Requested-BW-DL";
}

- (uint32_t)avpCode
{
    return 554;
}

+ (uint32_t)avpCode
{
    return 554;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

