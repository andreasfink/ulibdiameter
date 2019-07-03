//
//  UMDiameterAvpClient_Identity.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpClient_Identity.h"

@implementation UMDiameterAvpClient_Identity


- (NSString *)avpType
{
    return @"Client-Identity";
}

- (uint32_t)avpCode
{
    return 1480;
}

+ (uint32_t)avpCode
{
    return 1480;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

