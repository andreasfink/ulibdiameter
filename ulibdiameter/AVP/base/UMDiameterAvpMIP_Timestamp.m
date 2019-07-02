//
//  UMDiameterAvpMIP_Timestamp.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:31:41.274000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Timestamp.h"

@implementation UMDiameterAvpMIP_Timestamp


- (NSString *)avpType
{
    return @"MIP-Timestamp";
}

- (uint32_t)avpCode
{
    return 490;
}

+ (uint32_t)avpCode
{
    return 490;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

