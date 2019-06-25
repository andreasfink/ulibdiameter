//
//  UMDiameterAvp3GPP_Serving_Node.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Serving_Node.h"

@implementation UMDiameterAvp3GPP_Serving_Node


- (NSString *)avpType
{
    return @"SC-Serving-Node";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_Serving_Node;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterApplicationId_3GPP;
}

- (NSString *)stringValue
{
    return NULL;
}

-(void)setStringValue:(NSString *)str
{
}

@end
