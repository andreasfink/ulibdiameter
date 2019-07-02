//
//  UMDiameterAvpTermination_Cause.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:12.639000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTermination_Cause.h"

@implementation UMDiameterAvpTermination_Cause


- (NSString *)avpType
{
    return @"Termination-Cause";
}

- (uint32_t)avpCode
{
    return 295;
}

+ (uint32_t)avpCode
{
    return 295;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

