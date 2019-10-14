//
//  UMDiameterAvpOccurrence_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOccurrence_Info.h"

@implementation UMDiameterAvpOccurrence_Info


- (NSString *)avpType
{
    return @"Occurrence-Info";
}

- (uint32_t)avpCode
{
    return 2538;
}

+ (uint32_t)avpCode
{
    return 2538;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

