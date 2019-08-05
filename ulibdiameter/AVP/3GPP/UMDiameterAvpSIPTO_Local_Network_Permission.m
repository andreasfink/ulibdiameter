//
//  UMDiameterAvpSIPTO_Local_Network_Permission.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIPTO_Local_Network_Permission.h"

@implementation UMDiameterAvpSIPTO_Local_Network_Permission


- (NSString *)avpType
{
    return @"SIPTO-Local-Network-Permission";
}

- (uint32_t)avpCode
{
    return 1665;
}

+ (uint32_t)avpCode
{
    return 1665;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

