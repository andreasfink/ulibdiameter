//
//  UMDiameterAvpFeature_List.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFeature_List.h"

@implementation UMDiameterAvpFeature_List


- (NSString *)avpType
{
    return @"Feature-List";
}

- (uint32_t)avpCode
{
    return 630;
}

+ (uint32_t)avpCode
{
    return 630;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

