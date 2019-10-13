//
//  UMDiameterAvpResponse_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpResponse_Time.h"

@implementation UMDiameterAvpResponse_Time


- (NSString *)avpType
{
    return @"Response-Time";
}

- (uint32_t)avpCode
{
    return 2509;
}

+ (uint32_t)avpCode
{
    return 2509;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

