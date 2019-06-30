//
//  UMDiameterAvpSession_Id.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpSession_Id.h"

@implementation UMDiameterAvpSession_Id


- (NSString *)avpType
{
    return @"Session-Id";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_Session_Id;
}


@end
