//
//  UMDiameterAvpImmediate_Response_Preferred.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUnsigned32.h"

@implementation UMDiameterAvpImmediate_Response_Preferred


- (NSString *)avpType
{
    return @"Immediate-Response-Preferred";
}

- (uint32_t)avpCode
{
    return 1412;
}

+ (uint32_t)avpCode
{
    return 1412;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

