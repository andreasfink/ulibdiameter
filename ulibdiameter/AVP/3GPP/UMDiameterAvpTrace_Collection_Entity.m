//
//  UMDiameterAvpTrace_Collection_Entity.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvp.h>
#import <ulibdiameter/AVP/3GPP/UMDiameterAvpTrace_Collection_Entity.h>

@implementation UMDiameterAvpTrace_Collection_Entity


- (NSString *)avpType
{
    return @"Trace-Collection-Entity";
}

- (uint32_t)avpCode
{
    return 1452;
}

+ (uint32_t)avpCode
{
    return 1452;
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
    avpDef[@"name"] = @"trace-collection-entity";
    avpDef[@"type"] = @"Address";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

