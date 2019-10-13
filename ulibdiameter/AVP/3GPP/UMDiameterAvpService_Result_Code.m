//
//  UMDiameterAvpService_Result_Code.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Result_Code.h"

@implementation UMDiameterAvpService_Result_Code


- (NSString *)avpType
{
    return @"Service-Result-Code";
}

- (uint32_t)avpCode
{
    return 3147;
}

+ (uint32_t)avpCode
{
    return 3147;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

