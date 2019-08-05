//
//  UMDiameterAvpTime_Of_Day_Start.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.427000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTime_Of_Day_Start.h"

@implementation UMDiameterAvpTime_Of_Day_Start


- (NSString *)avpType
{
    return @"Time-Of-Day-Start";
}

- (uint32_t)avpCode
{
    return 561;
}

+ (uint32_t)avpCode
{
    return 561;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

