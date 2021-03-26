//
//  UMDiameterAvpApplication_Port_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 22:38:32.093081
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpApplication_Port_Identifier.h"

@implementation UMDiameterAvpApplication_Port_Identifier


- (NSString *)avpType
{
    return @"Application-Port-Identifier";
}

- (uint32_t)avpCode
{
    return 3010;
}

+ (uint32_t)avpCode
{
    return 3010;
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
    avpDef[@"name"] = @"application-port-identifier";
    avpDef[@"type"] = @"Unsigned32";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

