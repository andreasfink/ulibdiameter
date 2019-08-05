//
//  UMDiameterAvpCell_Global_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCell_Global_Identity.h"

@implementation UMDiameterAvpCell_Global_Identity


- (NSString *)avpType
{
    return @"Cell-Global-Identity";
}

- (uint32_t)avpCode
{
    return 1604;
}

+ (uint32_t)avpCode
{
    return 1604;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

