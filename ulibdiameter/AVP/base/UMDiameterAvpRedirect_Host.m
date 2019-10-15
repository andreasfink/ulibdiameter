//
//  UMDiameterAvpRedirect_Host.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:18.862000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRedirect_Host.h"

@implementation UMDiameterAvpRedirect_Host


- (NSString *)avpType
{
    return @"Redirect-Host";
}

- (uint32_t)avpCode
{
    return 292;
}

+ (uint32_t)avpCode
{
    return 292;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

