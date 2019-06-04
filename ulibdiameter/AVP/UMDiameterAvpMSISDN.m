//
//  UMDiameterAvpMSISDN.m
//  ulibdiameter
//
//  Created by Andreas Fink on 04.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpMSISDN.h"

#import <ulibgsmmap/ulibgsmmap.h>




@implementation UMDiameterAvpMSISDN

- (NSString *)avpType
{
    return @"MSISDN";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_MSISDN;
}


- (void)setValue:(NSString *)digits
{
   UMGSMMAP_AddressString *a =  [[UMGSMMAP_AddressString alloc]initWithString:digits];
    [a processBeforeEncode];
    NSData *d = [a value];
    _avpData = d;
}

- (NSString *)value
{
    UMGSMMAP_AddressString *a =  [[UMGSMMAP_AddressString alloc]initWithValue:_avpData];
    return [a stringValue];
}


@end
