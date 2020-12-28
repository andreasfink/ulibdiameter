//
//  UMDiameterAvpMSC_Absent_User_Diagnostic_SM.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMSC_Absent_User_Diagnostic_SM.h"

@implementation UMDiameterAvpMSC_Absent_User_Diagnostic_SM


- (NSString *)avpType
{
    return @"MSC-Absent-User-Diagnostic-SM";
}

- (uint32_t)avpCode
{
    return 3314;
}

+ (uint32_t)avpCode
{
    return 3314;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = YES, _vendorCode = 10415 */
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"msc-absent-user-diagnostic-sm";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

