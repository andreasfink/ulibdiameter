//
//  UMDiameterAvpExtended_Max_Requested_BW_DL.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExtended_Max_Requested_BW_DL.h"

@implementation UMDiameterAvpExtended_Max_Requested_BW_DL


- (NSString *)avpType
{
    return @"Extended-Max-Requested-BW-DL";
}

- (uint32_t)avpCode
{
    return 554;
}

+ (uint32_t)avpCode
{
    return 554;
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
    avpDef[@"name"] = @"extended-max-requested-bw-dl";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

