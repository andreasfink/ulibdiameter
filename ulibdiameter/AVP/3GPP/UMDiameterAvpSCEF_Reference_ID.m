//
//  UMDiameterAvpSCEF_Reference_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCEF_Reference_ID.h"

@implementation UMDiameterAvpSCEF_Reference_ID


- (NSString *)avpType
{
    return @"SCEF-Reference-ID";
}

- (uint32_t)avpCode
{
    return 3124;
}

+ (uint32_t)avpCode
{
    return 3124;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

