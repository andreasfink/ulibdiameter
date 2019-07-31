//
//  UMDiameterAvpMIP6_Feature_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.217000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP6_Feature_Vector.h"

@implementation UMDiameterAvpMIP6_Feature_Vector


- (NSString *)avpType
{
    return @"MIP6-Feature-Vector";
}

- (uint32_t)avpCode
{
    return 124;
}

+ (uint32_t)avpCode
{
    return 124;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

