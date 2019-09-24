//
//  UMDiameterAvpMSC_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMSC_Number.h"

@implementation UMDiameterAvpMSC_Number


- (NSString *)avpType
{
    return @"MSC-Number";
}

- (uint32_t)avpCode
{
    return 2403;
}

+ (uint32_t)avpCode
{
    return 2403;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end
