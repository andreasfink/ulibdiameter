//
//  UMDiameterAvpGroup_Service_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGroup_Service_Id.h"

@implementation UMDiameterAvpGroup_Service_Id


- (NSString *)avpType
{
    return @"Group-Service-Id";
}

- (uint32_t)avpCode
{
    return 1676;
}

+ (uint32_t)avpCode
{
    return 1676;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

