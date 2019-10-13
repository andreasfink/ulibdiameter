//
//  UMDiameterAvpData_Reference.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpData_Reference.h"

@implementation UMDiameterAvpData_Reference


- (NSString *)avpType
{
    return @"Data-Reference";
}

- (uint32_t)avpCode
{
    return 703;
}

+ (uint32_t)avpCode
{
    return 703;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

