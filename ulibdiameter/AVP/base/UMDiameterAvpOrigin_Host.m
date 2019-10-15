//
//  UMDiameterAvpOrigin_Host.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:18.862000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOrigin_Host.h"

@implementation UMDiameterAvpOrigin_Host


- (NSString *)avpType
{
    return @"Origin-Host";
}

- (uint32_t)avpCode
{
    return 264;
}

+ (uint32_t)avpCode
{
    return 264;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

