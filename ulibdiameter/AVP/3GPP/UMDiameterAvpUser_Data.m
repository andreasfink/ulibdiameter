//
//  UMDiameterAvpUser_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_Data.h"

@implementation UMDiameterAvpUser_Data


- (NSString *)avpType
{
    return @"User-Data";
}

- (uint32_t)avpCode
{
    return 702;
}

+ (uint32_t)avpCode
{
    return 702;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

