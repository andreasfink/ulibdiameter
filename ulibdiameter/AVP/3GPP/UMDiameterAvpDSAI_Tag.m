//
//  UMDiameterAvpDSAI_Tag.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
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
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

