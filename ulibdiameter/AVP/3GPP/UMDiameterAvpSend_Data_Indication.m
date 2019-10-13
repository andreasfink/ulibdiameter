//
//  UMDiameterAvpSend_Data_Indication.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSend_Data_Indication.h"

@implementation UMDiameterAvpSend_Data_Indication


- (NSString *)avpType
{
    return @"Send-Data-Indication";
}

- (uint32_t)avpCode
{
    return 710;
}

+ (uint32_t)avpCode
{
    return 710;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

