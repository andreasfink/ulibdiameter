//
//  UMDiameterAvpServing_Node_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServing_Node_Indication.h"

@implementation UMDiameterAvpServing_Node_Indication


- (NSString *)avpType
{
    return @"Serving-Node-Indication";
}

- (uint32_t)avpCode
{
    return 714;
}

+ (uint32_t)avpCode
{
    return 714;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

