//
//  UMDiameterAvpContext_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpContext_Identifier.h"

@implementation UMDiameterAvpContext_Identifier


- (NSString *)avpType
{
    return @"Context-Identifier";
}

- (uint32_t)avpCode
{
    return 1423;
}

+ (uint32_t)avpCode
{
    return 1423;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end
