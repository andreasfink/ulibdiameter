//
//  UMDiameterAvpFirmwareRevision.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpFirmwareRevision.h"

@implementation UMDiameterAvpFirmwareRevision

- (NSString *)avpType
{
    return @"FirmwareRevision";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_FirmwareRevision;
}


@end
