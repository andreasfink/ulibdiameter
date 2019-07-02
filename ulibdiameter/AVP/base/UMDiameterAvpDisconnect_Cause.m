//
//  UMDiameterAvpDisconnect_Cause.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:26.522000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDisconnect_Cause.h"

@implementation UMDiameterAvpDisconnect_Cause


- (NSString *)avpType
{
    return @"Disconnect-Cause";
}

- (uint32_t)avpCode
{
    return 273;
}

+ (uint32_t)avpCode
{
    return 273;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

