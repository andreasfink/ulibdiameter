//
//  UMDiameterAvpTrace_Reference.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpTrace_Reference


- (NSString *)avpType
{
    return @"Trace-Reference";
}

- (uint32_t)avpCode
{
    return 1459;
}

+ (uint32_t)avpCode
{
    return 1459;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

