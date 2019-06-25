//
//  UMDiameterAvp3GPP_External_Identifier.m
//  ulibdiameter
//
//  Created by Andreas Fink on 25.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_External_Identifier.h"

@implementation UMDiameterAvp3GPP_External_Identifier


- (NSString *)avpType
{
    return @"External-Identifier";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_External_Identifier;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = UMDiameterApplicationId_3GPP;
}

@end
