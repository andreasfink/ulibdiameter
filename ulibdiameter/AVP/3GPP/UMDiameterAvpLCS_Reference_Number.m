//
//  UMDiameterAvpLCS_Reference_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Reference_Number.h"

@implementation UMDiameterAvpLCS_Reference_Number


- (NSString *)avpType
{
    return @"LCS-Reference-Number";
}

- (uint32_t)avpCode
{
    return 2531;
}

+ (uint32_t)avpCode
{
    return 2531;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

