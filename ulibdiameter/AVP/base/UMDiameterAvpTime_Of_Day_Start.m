//
//  UMDiameterAvpTime_Of_Day_Start.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:28.749000
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

