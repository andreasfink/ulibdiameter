//
//  UMDiameterAvpService_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Indication.h"

@implementation UMDiameterAvpService_Indication


- (NSString *)avpType
{
    return @"Service-Indication";
}

- (uint32_t)avpCode
{
    return 704;
}

+ (uint32_t)avpCode
{
    return 704;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

