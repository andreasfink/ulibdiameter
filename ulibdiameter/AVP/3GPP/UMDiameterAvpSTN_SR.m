//
//  UMDiameterAvpSTN_SR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSTN_SR.h"

@implementation UMDiameterAvpSTN_SR


- (NSString *)avpType
{
    return @"STN-SR";
}

- (uint32_t)avpCode
{
    return 1433;
}

+ (uint32_t)avpCode
{
    return 1433;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end
