//
//  UMDiameterAvpImmediate_Response_Preferred.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpImmediate_Response_Preferred.h"

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

