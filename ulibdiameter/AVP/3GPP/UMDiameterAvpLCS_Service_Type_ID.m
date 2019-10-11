//
//  UMDiameterAvpLCS_Service_Type_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Service_Type_ID.h"

@implementation UMDiameterAvpLCS_Service_Type_ID


- (NSString *)avpType
{
    return @"LCS-Service-Type-ID";
}

- (uint32_t)avpCode
{
    return 2520;
}

+ (uint32_t)avpCode
{
    return 2520;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

