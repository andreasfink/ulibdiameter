//
//  UMDiameterAvpAccounting_Sub_Session_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:00.964000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccounting_Sub_Session_Id.h"

@implementation UMDiameterAvpAccounting_Sub_Session_Id


- (NSString *)avpType
{
    return @"Accounting-Sub-Session-Id";
}

- (uint32_t)avpCode
{
    return 287;
}

+ (uint32_t)avpCode
{
    return 287;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"accounting-sub-session-id";
    avpDef[@"type"] = @"Unsigned64";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

