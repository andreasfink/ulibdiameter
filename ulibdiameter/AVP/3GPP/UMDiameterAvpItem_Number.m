//
//  UMDiameterAvpItem_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpItem_Number.h"

@implementation UMDiameterAvpItem_Number


- (NSString *)avpType
{
    return @"Item-Number";
}

- (uint32_t)avpCode
{
    return 1419;
}

+ (uint32_t)avpCode
{
    return 1419;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

