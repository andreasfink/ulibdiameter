//
//  UMDiameterAvpTime_Of_Day_End.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:28.749000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTime_Of_Day_End.h"

@implementation UMDiameterAvpTime_Of_Day_End


- (NSString *)avpType
{
    return @"Time-Of-Day-End";
}

- (uint32_t)avpCode
{
    return 562;
}

+ (uint32_t)avpCode
{
    return 562;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

