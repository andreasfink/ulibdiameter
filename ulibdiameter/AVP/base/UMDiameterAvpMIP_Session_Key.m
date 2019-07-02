//
//  UMDiameterAvpMIP_Session_Key.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 21:59:20.338000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Session_Key.h"

@implementation UMDiameterAvpMIP_Session_Key


- (NSString *)avpType
{
    return @"MIP-Session-Key";
}

- (uint32_t)avpCode
{
    return 343;
}

+ (uint32_t)avpCode
{
    return 343;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

