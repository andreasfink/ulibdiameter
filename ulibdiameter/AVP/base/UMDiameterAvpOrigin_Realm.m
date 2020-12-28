//
//  UMDiameterAvpOrigin_Realm.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:28.084823
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOrigin_Realm.h"

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
    /* _vendorFlag = NO, _vendorCode = 0 */
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

