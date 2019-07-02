//
//  UMDiameterAvpFirmware_Revision.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:14:01.984000
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

