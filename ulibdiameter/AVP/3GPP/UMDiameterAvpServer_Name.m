//
//  UMDiameterAvpServer_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServer_Name.h"

@implementation UMDiameterAvpServer_Name


- (NSString *)avpType
{
    return @"Server-Name";
}

- (uint32_t)avpCode
{
    return 602;
}

+ (uint32_t)avpCode
{
    return 602;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

