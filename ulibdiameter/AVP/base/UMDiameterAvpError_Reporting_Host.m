//
//  UMDiameterAvpError_Reporting_Host.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:20.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpError_Reporting_Host.h"

@implementation UMDiameterAvpError_Reporting_Host


- (NSString *)avpType
{
    return @"Error-Reporting-Host";
}

- (uint32_t)avpCode
{
    return 294;
}

+ (uint32_t)avpCode
{
    return 294;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"error-reporting-host";
    avpDef[@"type"] = @"DiameterIdentity";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

