//
//  UMDiameterAvpErrorMessage.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpErrorMessage.h"

@implementation UMDiameterAvpErrorMessage


- (NSString *)avpType
{
    return @"ErrorMessage";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_ErrorMessage;
}


@end
