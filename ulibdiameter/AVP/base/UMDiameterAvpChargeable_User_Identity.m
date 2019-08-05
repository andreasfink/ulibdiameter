//
//  UMDiameterAvpChargeable_User_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpChargeable_User_Identity.h"

@implementation UMDiameterAvpChargeable_User_Identity


- (NSString *)avpType
{
    return @"Chargeable-User-Identity";
}

- (uint32_t)avpCode
{
    return 89;
}

+ (uint32_t)avpCode
{
    return 89;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

