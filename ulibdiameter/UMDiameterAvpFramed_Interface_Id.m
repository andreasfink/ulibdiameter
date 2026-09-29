//
//  UMDiameterAvpFramed_Interface_Id.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:43:54.490810
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpFramed_Interface_Id.h>

@implementation UMDiameterAvpFramed_Interface_Id


- (NSString *)avpType
{
    return @"Framed-Interface-Id";
}

- (uint32_t)avpCode
{
    return 96;
}

+ (uint32_t)avpCode
{
    return 96;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"framed-interface-id";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

