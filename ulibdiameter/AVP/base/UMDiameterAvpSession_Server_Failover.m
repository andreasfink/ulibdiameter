//
//  UMDiameterAvpSession_Server_Failover.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:20.998000
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"session-server-failover";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

