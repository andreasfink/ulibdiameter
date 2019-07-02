//
//  UMDiameterAvpDestination_Host.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:12.639000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDestination_Host.h"

@implementation UMDiameterAvpDestination_Host


- (NSString *)avpType
{
    return @"Destination-Host";
}

- (uint32_t)avpCode
{
    return 293;
}

+ (uint32_t)avpCode
{
    return 293;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

