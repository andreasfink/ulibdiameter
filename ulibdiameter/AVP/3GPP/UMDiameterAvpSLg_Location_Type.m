//
//  UMDiameterAvpSLg_Location_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSLg_Location_Type.h"

@implementation UMDiameterAvpSLg_Location_Type


- (NSString *)avpType
{
    return @"SLg-Location-Type";
}

- (uint32_t)avpCode
{
    return 2500;
}

+ (uint32_t)avpCode
{
    return 2500;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

