//
//  UMDiameterAvpReference_ID_Validity_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReference_ID_Validity_Time.h"

@implementation UMDiameterAvpReference_ID_Validity_Time


- (NSString *)avpType
{
    return @"Reference-ID-Validity-Time";
}

- (uint32_t)avpCode
{
    return 3148;
}

+ (uint32_t)avpCode
{
    return 3148;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

