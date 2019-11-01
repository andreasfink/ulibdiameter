//
//  UMDiameterAvpPDN_Connection_Continuity.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPDN_Connection_Continuity.h"

@implementation UMDiameterAvpPDN_Connection_Continuity


- (NSString *)avpType
{
    return @"PDN-Connection-Continuity";
}

- (uint32_t)avpCode
{
    return 1690;
}

+ (uint32_t)avpCode
{
    return 1690;
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
    avpDef[@"name"] = @"pdn-connection-continuity";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

