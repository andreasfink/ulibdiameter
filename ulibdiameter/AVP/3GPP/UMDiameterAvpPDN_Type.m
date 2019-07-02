//
//  UMDiameterAvpPDN_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPDN_Type.h"

@implementation UMDiameterAvpPDN_Type


- (NSString *)avpType
{
    return @"PDN-Type";
}

- (uint32_t)avpCode
{
    return 1456;
}

+ (uint32_t)avpCode
{
    return 1456;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

