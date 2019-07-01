//
//  UMDiameterAvpFirmware_Revision.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFirmware_Revision.h"

@implementation UMDiameterAvpFirmware_Revision


- (NSString *)avpType
{
    return @"Firmware-Revision";
}

- (uint32_t)avpCode
{
    return 267;
}

+ (uint32_t)avpCode
{
    return 267;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

