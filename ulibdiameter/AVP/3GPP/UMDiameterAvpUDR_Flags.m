//
//  UMDiameterAvpUDR_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUDR_Flags.h"

@implementation UMDiameterAvpUDR_Flags


- (NSString *)avpType
{
    return @"UDR-Flags";
}

- (uint32_t)avpCode
{
    return 719;
}

+ (uint32_t)avpCode
{
    return 719;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

