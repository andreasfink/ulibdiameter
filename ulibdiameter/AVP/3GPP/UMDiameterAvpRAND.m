//
//  UMDiameterAvpRAND.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRAND.h"

@implementation UMDiameterAvpRAND


- (NSString *)avpType
{
    return @"RAND";
}

- (uint32_t)avpCode
{
    return 1447;
}

+ (uint32_t)avpCode
{
    return 1447;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

