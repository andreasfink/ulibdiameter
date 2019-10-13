//
//  UMDiameterAvpLCS_QoS_Class.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_QoS_Class.h"

@implementation UMDiameterAvpLCS_QoS_Class


- (NSString *)avpType
{
    return @"LCS-QoS-Class";
}

- (uint32_t)avpCode
{
    return 2523;
}

+ (uint32_t)avpCode
{
    return 2523;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

