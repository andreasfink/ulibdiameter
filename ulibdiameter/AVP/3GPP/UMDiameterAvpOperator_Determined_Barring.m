//
//  UMDiameterAvpOperator_Determined_Barring.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOperator_Determined_Barring.h"

@implementation UMDiameterAvpOperator_Determined_Barring


- (NSString *)avpType
{
    return @"Operator-Determined-Barring";
}

- (uint32_t)avpCode
{
    return 1425;
}

+ (uint32_t)avpCode
{
    return 1425;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

