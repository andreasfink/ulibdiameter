//
//  UMDiameterAvpAdditional_Context_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAdditional_Context_Identifier.h"

@implementation UMDiameterAvpAdditional_Context_Identifier


- (NSString *)avpType
{
    return @"Additional-Context-Identifier";
}

- (uint32_t)avpCode
{
    return 1683;
}

+ (uint32_t)avpCode
{
    return 1683;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

