//
//  UMDiameterAvpProductName.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpProductName.h"

@implementation UMDiameterAvpProductName



- (NSString *)avpType
{
    return @"ProductName";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_ProductName;
}


@end
