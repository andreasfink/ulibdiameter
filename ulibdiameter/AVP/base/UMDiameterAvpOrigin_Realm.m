//
//  UMDiameterAvpOrigin_Realm.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvp.h>
#import <ulibdiameter/AVP/base/UMDiameterAvpOrigin_Realm.h>

@implementation UMDiameterAvpOrigin_Realm


- (NSString *)avpType
{
    return @"Origin-Realm";
}

- (uint32_t)avpCode
{
    return 296;
}

+ (uint32_t)avpCode
{
    return 296;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"origin-realm";
    avpDef[@"type"] = @"DiameterIdentity";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

