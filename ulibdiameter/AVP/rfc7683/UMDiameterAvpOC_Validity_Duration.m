//
//  UMDiameterAvpOC_Validity_Duration.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.755000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_Validity_Duration.h"

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


@end

