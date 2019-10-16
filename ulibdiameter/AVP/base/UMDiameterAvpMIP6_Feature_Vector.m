//
//  UMDiameterAvpMIP6_Feature_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:20.998000
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mip6-feature-vector";
    avpDef[@"type"] = @"Unsigned64";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

