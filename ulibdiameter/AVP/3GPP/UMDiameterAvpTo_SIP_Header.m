//
//  UMDiameterAvpTo_SIP_Header.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTo_SIP_Header.h"

@implementation UMDiameterAvpTo_SIP_Header


- (NSString *)avpType
{
    return @"To-SIP-Header";
}

- (uint32_t)avpCode
{
    return 645;
}

+ (uint32_t)avpCode
{
    return 645;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

