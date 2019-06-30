//
//  UMDiameterAvpTrace_NE_Type_List.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpTrace_NE_Type_List


- (NSString *)avpType
{
    return @"Trace-NE-Type-List";
}

- (uint32_t)avpCode
{
    return 1463;
}

+ (uint32_t)avpCode
{
    return 1463;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

