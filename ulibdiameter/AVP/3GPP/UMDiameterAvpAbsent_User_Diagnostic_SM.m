//
//  UMDiameterAvpAbsent_User_Diagnostic_SM.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAbsent_User_Diagnostic_SM.h"

@implementation UMDiameterAvpAbsent_User_Diagnostic_SM


- (NSString *)avpType
{
    return @"Absent-User-Diagnostic-SM";
}

- (uint32_t)avpCode
{
    return 3322;
}

+ (uint32_t)avpCode
{
    return 3322;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"absent-user-diagnostic-sm";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end
