//
//  UMDiameterAvpPath.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPath.h"

@implementation UMDiameterAvpPath


- (NSString *)avpType
{
    return @"Path";
}

- (uint32_t)avpCode
{
    return 640;
}

+ (uint32_t)avpCode
{
    return 640;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

