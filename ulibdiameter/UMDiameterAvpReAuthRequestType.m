//
//  UMDiameterAvpReAuthRequestType.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpReAuthRequestType.h"

@implementation UMDiameterAvpReAuthRequestType

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AuthRequestType;
}


@end
