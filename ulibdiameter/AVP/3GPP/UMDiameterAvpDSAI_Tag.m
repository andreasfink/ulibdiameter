//
//  UMDiameterAvpDSAI_Tag.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDSAI_Tag.h"

@implementation UMDiameterAvpDSAI_Tag


- (NSString *)avpType
{
    return @"DSAI-Tag";
}

- (uint32_t)avpCode
{
    return 711;
}

+ (uint32_t)avpCode
{
    return 711;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

