//
//  UMDiameterAvpLCS_QoS_Class.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_QoS_Class.h"

@implementation UMDiameterAvpLCS_QoS_Class


- (NSString *)avpType
{
    return @"LCS-QoS-Class";
}

- (uint32_t)avpCode
{
    return 2523;
}

+ (uint32_t)avpCode
{
    return 2523;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

