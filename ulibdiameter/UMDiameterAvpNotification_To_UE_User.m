//
//  UMDiameterAvpNotification_To_UE_User.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpNotification_To_UE_User.h>

@implementation UMDiameterAvpNotification_To_UE_User


- (NSString *)avpType
{
    return @"Notification-To-UE-User";
}

- (uint32_t)avpCode
{
    return 1478;
}

+ (uint32_t)avpCode
{
    return 1478;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"notification-to-ue-user";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

