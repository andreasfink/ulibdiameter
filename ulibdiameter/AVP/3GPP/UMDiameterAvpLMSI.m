//
//  UMDiameterAvpLMSI.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLMSI.h"

@implementation UMDiameterAvpLMSI


- (NSString *)avpType
{
    return @"LMSI";
}

- (uint32_t)avpCode
{
    return 2400;
}

+ (uint32_t)avpCode
{
    return 2400;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

