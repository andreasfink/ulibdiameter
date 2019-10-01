//
//  UMDiameterAvpMandatory_Capability.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMandatory_Capability.h"

@implementation UMDiameterAvpMandatory_Capability


- (NSString *)avpType
{
    return @"Mandatory-Capability";
}

- (uint32_t)avpCode
{
    return 604;
}

+ (uint32_t)avpCode
{
    return 604;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

