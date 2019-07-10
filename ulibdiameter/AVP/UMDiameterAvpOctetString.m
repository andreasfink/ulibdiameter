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
    _avpData = [string dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)setDataValue:(NSData *)data
{
    _avpData = data;
}

- (void)setNumberValue:(NSNumber *)number
{
    NSString *string = [number stringValue];
    [self setStringValue:string];
}

- (void)setDictionaryValue:(NSDictionary *)dict
{
    NSString *string = [dict jsonString];
    [self setStringValue:string];
}

- (void)setDateValue:(NSDate *)date
{
    NSString *string = [date stringValue];
    [self setStringValue:string];
}


- (NSString *)stringValue
{
    NSString *s = [[NSString alloc]initWithData:_avpData encoding:NSUTF8StringEncoding];
    return s;
}

- (id)objectValue
{
    return _avpData;
}


@end
