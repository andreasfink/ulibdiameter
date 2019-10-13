//
//  UMDiameterAvpQoS_Class_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpQoS_Class_Identifier.h"

@implementation UMDiameterAvpQoS_Class_Identifier


- (NSString *)avpType
{
    return @"QoS-Class-Identifier";
}

- (uint32_t)avpCode
{
    return 1028;
}

+ (uint32_t)avpCode
{
    return 1028;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

