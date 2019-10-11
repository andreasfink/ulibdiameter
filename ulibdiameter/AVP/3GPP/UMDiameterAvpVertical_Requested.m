//
//  UMDiameterAvpVertical_Requested.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVertical_Requested.h"

@implementation UMDiameterAvpVertical_Requested


- (NSString *)avpType
{
    return @"Vertical-Requested";
}

- (uint32_t)avpCode
{
    return 2507;
}

+ (uint32_t)avpCode
{
    return 2507;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

