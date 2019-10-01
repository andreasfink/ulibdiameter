//
//  UMDiameterAvpReason_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReason_Info.h"

@implementation UMDiameterAvpReason_Info


- (NSString *)avpType
{
    return @"Reason-Info";
}

- (uint32_t)avpCode
{
    return 617;
}

+ (uint32_t)avpCode
{
    return 617;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

