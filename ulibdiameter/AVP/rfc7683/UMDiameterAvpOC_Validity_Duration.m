//
//  UMDiameterAvpOC_Validity_Duration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 09:15:57.082000
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

