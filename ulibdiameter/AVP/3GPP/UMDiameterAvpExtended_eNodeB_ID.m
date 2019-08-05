//
//  UMDiameterAvpExtended_eNodeB_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExtended_eNodeB_ID.h"

@implementation UMDiameterAvpExtended_eNodeB_ID


- (NSString *)avpType
{
    return @"Extended-eNodeB-ID";
}

- (uint32_t)avpCode
{
    return 4013;
}

+ (uint32_t)avpCode
{
    return 4013;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

