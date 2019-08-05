//
//  UMDiameterAvpSMS_Register_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSMS_Register_Request.h"

@implementation UMDiameterAvpSMS_Register_Request


- (NSString *)avpType
{
    return @"SMS-Register-Request";
}

- (uint32_t)avpCode
{
    return 1648;
}

+ (uint32_t)avpCode
{
    return 1648;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

