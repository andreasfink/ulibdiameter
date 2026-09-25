//
//  UMDiameterAvpOC_Validity_Duration.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.741533
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvp.h>
#import <ulibdiameter/AVP/rfc7683/UMDiameterAvpOC_Validity_Duration.h>
@implementation UMDiameterAvpOC_Validity_Duration


- (NSString *)avpType
{
    return @"OC-Validity-Duration";
}

- (uint32_t)avpCode
{
    return 625;
}

+ (uint32_t)avpCode
{
    return 625;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"oc-validity-duration";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

