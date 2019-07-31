//
//  UMDiameterAvpFramed_Interface_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.283000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFramed_Interface_Id.h"

@implementation UMDiameterAvpFramed_Interface_Id


- (NSString *)avpType
{
    return @"Framed-Interface-Id";
}

- (uint32_t)avpCode
{
    return 96;
}

+ (uint32_t)avpCode
{
    return 96;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

