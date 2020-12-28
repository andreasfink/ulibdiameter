//
//  UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature.h"

@implementation UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature


- (NSString *)avpType
{
    return @"Roaming-Restricted-Due-To-Unsupported-Feature";
}

- (uint32_t)avpCode
{
    return 1457;
}

+ (uint32_t)avpCode
{
    return 1457;
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
    avpDef[@"name"] = @"roaming-restricted-due-to-unsupported-feature";
    avpDef[@"type"] = @"Enumerated";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

