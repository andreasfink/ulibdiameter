//
//  UMDiameterAvpTerminal_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpTerminal_Information


- (NSString *)avpType
{
    return @"Terminal-Information";
}

- (uint32_t)avpCode
{
    return 1401;
}

+ (uint32_t)avpCode
{
    return 1401;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

