//
//  UMDiameterAvpSession_Server_Failover.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:39:39.689000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSession_Server_Failover.h"

@implementation UMDiameterAvpSession_Server_Failover


- (NSString *)avpType
{
    return @"Session-Server-Failover";
}

- (uint32_t)avpCode
{
    return 271;
}

+ (uint32_t)avpCode
{
    return 271;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

