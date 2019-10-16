//
//  UMDiameterAvpRedirect_Max_Cache_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:20.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRedirect_Max_Cache_Time.h"

@implementation UMDiameterAvpRedirect_Max_Cache_Time


- (NSString *)avpType
{
    return @"Redirect-Max-Cache-Time";
}

- (uint32_t)avpCode
{
    return 262;
}

+ (uint32_t)avpCode
{
    return 262;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"redirect-max-cache-time";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

