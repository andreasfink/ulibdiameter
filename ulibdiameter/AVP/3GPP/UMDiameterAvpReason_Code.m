//
//  UMDiameterAvpReason_Code.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReason_Code.h"

@implementation UMDiameterAvpReason_Code


- (NSString *)avpType
{
    return @"Reason-Code";
}

- (uint32_t)avpCode
{
    return 616;
}

+ (uint32_t)avpCode
{
    return 616;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end
