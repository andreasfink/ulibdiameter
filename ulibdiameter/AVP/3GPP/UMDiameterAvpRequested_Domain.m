//
//  UMDiameterAvpRequested_Domain.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRequested_Domain.h"

@implementation UMDiameterAvpRequested_Domain


- (NSString *)avpType
{
    return @"Requested-Domain ";
}

- (uint32_t)avpCode
{
    return 706;
}

+ (uint32_t)avpCode
{
    return 706;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

