//
//  UMDiameterAvpEquipment_Status.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpEquipment_Status


- (NSString *)avpType
{
    return @"Equipment-Status";
}

- (uint32_t)avpCode
{
    return 1445;
}

+ (uint32_t)avpCode
{
    return 1445;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

