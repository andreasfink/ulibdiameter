//
//  UMDiameterAvpExternal_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExternal_Identifier.h"

@implementation UMDiameterAvpExternal_Identifier


- (NSString *)avpType
{
    return @"External-Identifier";
}

- (uint32_t)avpCode
{
    return 3111;
}

+ (uint32_t)avpCode
{
    return 3111;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

