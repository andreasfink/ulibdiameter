//
//  UMDiameterAvpExtended_eNodeB_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExtended_eNodeB_ID.h"

@implementation UMDiameterAvpExtended_eNodeB_ID


- (NSString *)avpType
{
    return @"Extended-eNodeB-ID";
}

- (uint32_t)avpCode
{
    return 4013;
}

+ (uint32_t)avpCode
{
    return 4013;
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
    avpDef[@"name"] = @"extended-enodeb-id";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

