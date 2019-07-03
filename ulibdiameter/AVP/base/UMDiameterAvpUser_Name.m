//
//  UMDiameterAvpUser_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_Name.h"

@implementation UMDiameterAvpUser_Name


- (NSString *)avpType
{
    return @"User-Name";
}

- (uint32_t)avpCode
{
    return 1;
}

+ (uint32_t)avpCode
{
    return 1;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

