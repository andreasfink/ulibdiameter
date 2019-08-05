//
//  UMDiameterAvpSession_Server_Failover.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.427000
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

