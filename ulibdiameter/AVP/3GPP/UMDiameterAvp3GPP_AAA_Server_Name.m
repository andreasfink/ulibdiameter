//
//  UMDiameterAvp3GPP_AAA_Server_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvp3GPP_AAA_Server_Name.h"

@implementation UMDiameterAvp3GPP_AAA_Server_Name


- (NSString *)avpType
{
    return @"3GPP-AAA-Server-Name";
}

- (uint32_t)avpCode
{
    return 318;
}

+ (uint32_t)avpCode
{
    return 318;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

