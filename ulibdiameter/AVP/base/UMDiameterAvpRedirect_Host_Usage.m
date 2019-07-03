//
//  UMDiameterAvpRedirect_Host_Usage.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRedirect_Host_Usage.h"

@implementation UMDiameterAvpRedirect_Host_Usage


- (NSString *)avpType
{
    return @"Redirect-Host-Usage";
}

- (uint32_t)avpCode
{
    return 261;
}

+ (uint32_t)avpCode
{
    return 261;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end
