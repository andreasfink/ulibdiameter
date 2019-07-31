//
//  UMDiameterAvpOC_Report_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:38.100000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_Report_Type.h"

@implementation UMDiameterAvpOC_Report_Type


- (NSString *)avpType
{
    return @"OC-Report-Type";
}

- (uint32_t)avpCode
{
    return 626;
}

+ (uint32_t)avpCode
{
    return 626;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

