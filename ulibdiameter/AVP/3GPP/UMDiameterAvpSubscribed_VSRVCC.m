//
//  UMDiameterAvpSubscribed_VSRVCC.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscribed_VSRVCC.h"

@implementation UMDiameterAvpSubscribed_VSRVCC


- (NSString *)avpType
{
    return @"Subscribed-VSRVCC";
}

- (uint32_t)avpCode
{
    return 1636;
}

+ (uint32_t)avpCode
{
    return 1636;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

