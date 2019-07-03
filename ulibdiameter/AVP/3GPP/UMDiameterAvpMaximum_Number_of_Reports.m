//
//  UMDiameterAvpMaximum_Number_of_Reports.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMaximum_Number_of_Reports.h"

@implementation UMDiameterAvpMaximum_Number_of_Reports


- (NSString *)avpType
{
    return @"Maximum-Number-of-Reports";
}

- (uint32_t)avpCode
{
    return 3128;
}

+ (uint32_t)avpCode
{
    return 3128;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

