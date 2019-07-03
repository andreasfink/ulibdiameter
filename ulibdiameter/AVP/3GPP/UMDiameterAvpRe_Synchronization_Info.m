//
//  UMDiameterAvpRe_Synchronization_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRe_Synchronization_Info.h"

@implementation UMDiameterAvpRe_Synchronization_Info


- (NSString *)avpType
{
    return @"Re-Synchronization-Info";
}

- (uint32_t)avpCode
{
    return 1411;
}

+ (uint32_t)avpCode
{
    return 1411;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

