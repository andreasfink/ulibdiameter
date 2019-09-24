//
//  UMDiameterAvpOriginating_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOriginating_Request.h"

@implementation UMDiameterAvpOriginating_Request


- (NSString *)avpType
{
    return @"Originating-Request";
}

- (uint32_t)avpCode
{
    return 633;
}

+ (uint32_t)avpCode
{
    return 633;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

