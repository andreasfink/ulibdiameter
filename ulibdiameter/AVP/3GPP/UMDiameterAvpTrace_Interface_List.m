//
//  UMDiameterAvpTrace_Interface_List.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTrace_Interface_List.h"

@implementation UMDiameterAvpTrace_Interface_List


- (NSString *)avpType
{
    return @"Trace-Interface-List";
}

- (uint32_t)avpCode
{
    return 1464;
}

+ (uint32_t)avpCode
{
    return 1464;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

