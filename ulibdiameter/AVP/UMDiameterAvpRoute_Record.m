//
//  UMDiameterAvpRoute_Record.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterAvpRoute_Record


- (NSString *)avpType
{
    return @"Route-Record";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_RouteRecord;
}


@end
