//
//  UMDiameterAvpUserName.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUserName.h"


/* 8.14.  User-Name AVP

 The User-Name AVP (AVP Code 1) [RFC2865] is of type UTF8String, which
 contains the User-Name, in a format consistent with the NAI
 specification [RFC4282].

 */
@implementation UMDiameterAvpUserName


- (NSString *)avpType
{
    return @"UserName";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_UserName;
}


@end
