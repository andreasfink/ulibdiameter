//
//  UMDiameterAvpFailedAvp.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpFailedAvp.h"

@implementation UMDiameterAvpFailedAvp


- (NSString *)avpType
{
    return @"FailedAvp";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_FailedAvp;
}


@end
