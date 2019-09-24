//
//  UMDiameterAvpLCS_Service_Type_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
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

