//
//  UMDiameterAvpIDA_Flags.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIDA_Flags.h"

@implementation UMDiameterAvpIDA_Flags


- (NSString *)avpType
{
    return @"IDA-Flags";
}

- (uint32_t)avpCode
{
    return 1441;
}

+ (uint32_t)avpCode
{
    return 1441;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

