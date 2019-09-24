//
//  UMDiameterAvpLIPA_Permission.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
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

