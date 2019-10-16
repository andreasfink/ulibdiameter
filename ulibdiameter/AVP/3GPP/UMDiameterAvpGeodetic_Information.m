//
//  UMDiameterAvpGeodetic_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGeodetic_Information.h"

@implementation UMDiameterAvpGeodetic_Information


- (NSString *)avpType
{
    return @"Geodetic-Information";
}

- (uint32_t)avpCode
{
    return 1609;
}

+ (uint32_t)avpCode
{
    return 1609;
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
    avpDef[@"name"] = @"geodetic-information";
    avpDef[@"type"] = @"OctetString";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

