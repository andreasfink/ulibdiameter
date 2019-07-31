//
//  UMDiameterAvpFeature_List_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.400000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFeature_List_ID.h"

@implementation UMDiameterAvpFeature_List_ID


- (NSString *)avpType
{
    return @"Feature-List-ID";
}

- (uint32_t)avpCode
{
    return 629;
}

+ (uint32_t)avpCode
{
    return 629;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

