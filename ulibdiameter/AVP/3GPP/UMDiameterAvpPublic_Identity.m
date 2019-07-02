//
//  UMDiameterAvpPublic_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPublic_Identity.h"

@implementation UMDiameterAvpPublic_Identity


- (NSString *)avpType
{
    return @"Public-Identity";
}

- (uint32_t)avpCode
{
    return 601;
}

+ (uint32_t)avpCode
{
    return 601;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

