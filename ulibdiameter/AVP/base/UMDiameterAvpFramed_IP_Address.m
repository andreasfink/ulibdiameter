//
//  UMDiameterAvpFramed_IP_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.821000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFramed_IP_Address.h"

@implementation UMDiameterAvpFramed_IP_Address


- (NSString *)avpType
{
    return @"Framed-IP-Address";
}

- (uint32_t)avpCode
{
    return 8;
}

+ (uint32_t)avpCode
{
    return 8;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

