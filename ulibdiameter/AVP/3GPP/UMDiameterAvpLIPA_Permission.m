//
//  UMDiameterAvpLIPA_Permission.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLIPA_Permission.h"

@implementation UMDiameterAvpLIPA_Permission


- (NSString *)avpType
{
    return @"LIPA-Permission";
}

- (uint32_t)avpCode
{
    return 1618;
}

+ (uint32_t)avpCode
{
    return 1618;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end
