//
//  UMDiameterAvpDay_Of_Week_Mask.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:28.084823
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDay_Of_Week_Mask.h"

@implementation UMDiameterAvpDay_Of_Week_Mask


- (NSString *)avpType
{
    return @"Day-Of-Week-Mask";
}

- (uint32_t)avpCode
{
    return 563;
}

+ (uint32_t)avpCode
{
    return 563;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = NO, _vendorCode = 0 */
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"day-of-week-mask";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

