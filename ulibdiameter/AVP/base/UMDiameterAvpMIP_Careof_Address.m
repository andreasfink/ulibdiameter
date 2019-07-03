//
//  UMDiameterAvpMIP_Careof_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Careof_Address.h"

@implementation UMDiameterAvpMIP_Careof_Address


- (NSString *)avpType
{
    return @"MIP-Careof-Address";
}

- (uint32_t)avpCode
{
    return 487;
}

+ (uint32_t)avpCode
{
    return 487;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

