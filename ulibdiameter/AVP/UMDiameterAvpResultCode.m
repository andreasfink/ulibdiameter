//
//  UMDiameterAvpResultCode.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpResultCode.h"

@implementation UMDiameterAvpResultCode


- (NSString *)avpType
{
    return @"ResultCode";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_ResultCode;
}


@end
