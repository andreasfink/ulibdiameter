//
//  UMDiameterAvpOctetString.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"

@implementation UMDiameterAvpOctetString

- (NSString *)avpType
{
    return @"OctetString";
}

- (void)setStringValue:(NSString *)string
{
    _avpData =[string  dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)stringValue
{
    NSString *s = [[NSString alloc]initWithData:_avpData encoding:NSUTF8StringEncoding];
    return s;
}

@end
