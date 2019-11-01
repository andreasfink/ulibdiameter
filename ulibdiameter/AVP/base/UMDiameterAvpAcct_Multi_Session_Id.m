//
//  UMDiameterAvpAcct_Multi_Session_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAcct_Multi_Session_Id.h"

@implementation UMDiameterAvpAcct_Multi_Session_Id


- (NSString *)avpType
{
    return @"Acct-Multi-Session-Id";
}

- (uint32_t)avpCode
{
    return 50;
}

+ (uint32_t)avpCode
{
    return 50;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"acct-multi-session-id";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

