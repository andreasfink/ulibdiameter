//
//  UMDiameterAvpOC_Sequence_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:38.871000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_Sequence_Number.h"

@implementation UMDiameterAvpOC_Sequence_Number


- (NSString *)avpType
{
    return @"OC-Sequence-Number";
}

- (uint32_t)avpCode
{
    return 624;
}

+ (uint32_t)avpCode
{
    return 624;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

