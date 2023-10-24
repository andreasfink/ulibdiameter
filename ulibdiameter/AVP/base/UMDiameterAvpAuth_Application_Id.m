//
//  UMDiameterAvpAuth_Application_Id.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpAuth_Application_Id.h>
#import <ulibdiameter/UMDiameterApplicationId.h>

@implementation UMDiameterAvpAuth_Application_Id


- (NSString *)avpType
{
    return @"Auth-Application-Id";
}

- (uint32_t)avpCode
{
    return 258;
}

+ (uint32_t)avpCode
{
    return 258;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"auth-application-id";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);
    return avpDef;
}

-(id) objectValue
{
    NSNumber *n = [super numberValue];
    uint32_t    i = [n unsignedIntValue];
    UMSynchronizedSortedDictionary *d = [[UMSynchronizedSortedDictionary alloc]init];
    d[@"id"] = n;
    NSString *s = umdiameter_application_id_string(i);
    if(s)
    {
        d[@"name"] = s;
    }
    return d;
}

@end

