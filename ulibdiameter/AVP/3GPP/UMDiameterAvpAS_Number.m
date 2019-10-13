//
//  UMDiameterAvpAS_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAS_Number.h"

@implementation UMDiameterAvpAS_Number


- (NSString *)avpType
{
    return @"AS-Number";
}

- (uint32_t)avpCode
{
    return 722;
}

+ (uint32_t)avpCode
{
    return 722;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

