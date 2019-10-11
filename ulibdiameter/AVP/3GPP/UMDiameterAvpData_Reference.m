//
//  UMDiameterAvpData_Reference.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpData_Reference.h"

@implementation UMDiameterAvpData_Reference


- (NSString *)avpType
{
    return @"Data-Reference ";
}

- (uint32_t)avpCode
{
    return 703;
}

+ (uint32_t)avpCode
{
    return 703;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

