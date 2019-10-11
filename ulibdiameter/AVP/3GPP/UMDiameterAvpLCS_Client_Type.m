//
//  UMDiameterAvpLCS_Client_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Client_Type.h"

@implementation UMDiameterAvpLCS_Client_Type


- (NSString *)avpType
{
    return @"LCS-Client-Type";
}

- (uint32_t)avpCode
{
    return 1241;
}

+ (uint32_t)avpCode
{
    return 1241;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

