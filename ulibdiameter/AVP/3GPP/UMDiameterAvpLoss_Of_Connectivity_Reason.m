//
//  UMDiameterAvpLoss_Of_Connectivity_Reason.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoss_Of_Connectivity_Reason.h"

@implementation UMDiameterAvpLoss_Of_Connectivity_Reason


- (NSString *)avpType
{
    return @"Loss-Of-Connectivity-Reason";
}

- (uint32_t)avpCode
{
    return 3162;
}

+ (uint32_t)avpCode
{
    return 3162;
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
    avpDef[@"name"] = @"loss-of-connectivity-reason";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

