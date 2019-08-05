//
//  UMDiameterAvpError_Reporting_Host.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
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


@end

