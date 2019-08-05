//
//  UMDiameterAvpHost_IP_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.174000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpHost_IP_Address.h"

@implementation UMDiameterAvpHost_IP_Address


- (NSString *)avpType
{
    return @"Host-IP-Address";
}

- (uint32_t)avpCode
{
    return 257;
}

+ (uint32_t)avpCode
{
    return 257;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

