//
//  UMDiameterAvpPreferred_Data_Mode.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPreferred_Data_Mode.h"

@implementation UMDiameterAvpPreferred_Data_Mode


- (NSString *)avpType
{
    return @"Preferred-Data-Mode";
}

- (uint32_t)avpCode
{
    return 1686;
}

+ (uint32_t)avpCode
{
    return 1686;
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
    avpDef[@"name"] = @"preferred-data-mode";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

