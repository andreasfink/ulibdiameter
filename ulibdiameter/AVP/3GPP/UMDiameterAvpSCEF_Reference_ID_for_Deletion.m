//
//  UMDiameterAvpSCEF_Reference_ID_for_Deletion.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCEF_Reference_ID_for_Deletion.h"

@implementation UMDiameterAvpSCEF_Reference_ID_for_Deletion


- (NSString *)avpType
{
    return @"SCEF-Reference-ID-for-Deletion";
}

- (uint32_t)avpCode
{
    return 3126;
}

+ (uint32_t)avpCode
{
    return 3126;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

