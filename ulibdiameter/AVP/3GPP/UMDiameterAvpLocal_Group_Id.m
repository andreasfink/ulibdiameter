//
//  UMDiameterAvpLocal_Group_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocal_Group_Id.h"

@implementation UMDiameterAvpLocal_Group_Id


- (NSString *)avpType
{
    return @"Local-Group-Id";
}

- (uint32_t)avpCode
{
    return 1678;
}

+ (uint32_t)avpCode
{
    return 1678;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

