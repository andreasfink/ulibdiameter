//
//  UMDiameterAvpNotification_To_UE_User.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNotification_To_UE_User.h"

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


@end

