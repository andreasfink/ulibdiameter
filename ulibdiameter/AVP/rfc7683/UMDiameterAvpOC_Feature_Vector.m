//
//  UMDiameterAvpOC_Feature_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:35.278000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_Feature_Vector.h"

@implementation UMDiameterAvpOC_Feature_Vector


- (NSString *)avpType
{
    return @"OC-Feature-Vector";
}

- (uint32_t)avpCode
{
    return 622;
}

+ (uint32_t)avpCode
{
    return 622;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

