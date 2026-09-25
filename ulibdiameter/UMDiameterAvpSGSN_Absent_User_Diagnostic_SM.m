//
//  UMDiameterAvpSGSN_Absent_User_Diagnostic_SM.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpSGSN_Absent_User_Diagnostic_SM.h>

@implementation UMDiameterAvpSGSN_Absent_User_Diagnostic_SM


- (NSString *)avpType
{
    return @"SGSN-Absent-User-Diagnostic-SM";
}

- (uint32_t)avpCode
{
    return 3315;
}

+ (uint32_t)avpCode
{
    return 3315;
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
    avpDef[@"name"] = @"sgsn-absent-user-diagnostic-sm";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

