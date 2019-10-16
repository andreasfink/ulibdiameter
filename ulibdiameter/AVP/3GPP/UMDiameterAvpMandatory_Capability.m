//
//  UMDiameterAvpMandatory_Capability.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMandatory_Capability.h"

@implementation UMDiameterAvpMandatory_Capability


- (NSString *)avpType
{
    return @"Mandatory-Capability";
}

- (uint32_t)avpCode
{
    return 604;
}

+ (uint32_t)avpCode
{
    return 604;
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
    avpDef[@"name"] = @"mandatory-capability";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

