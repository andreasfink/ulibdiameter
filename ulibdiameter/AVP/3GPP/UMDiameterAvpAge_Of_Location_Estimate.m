//
//  UMDiameterAvpAge_Of_Location_Estimate.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAge_Of_Location_Estimate.h"

@implementation UMDiameterAvpAge_Of_Location_Estimate


- (NSString *)avpType
{
    return @"Age-Of-Location-Estimate";
}

- (uint32_t)avpCode
{
    return 2514;
}

+ (uint32_t)avpCode
{
    return 2514;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

