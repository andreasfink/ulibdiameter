//
//  UMDiameterAvpLine_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:53.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLine_Identifier.h"

@implementation UMDiameterAvpLine_Identifier


- (NSString *)avpType
{
    return @"Line-Identifier";
}

- (uint32_t)avpCode
{
    return 500;
}

+ (uint32_t)avpCode
{
    return 500;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 13019;
}


@end

