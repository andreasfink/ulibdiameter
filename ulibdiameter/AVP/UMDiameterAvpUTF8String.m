//
//  UMDiameterAvpUTF8String.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"

@implementation UMDiameterAvpUTF8String

- (UMDiameterAvpUTF8String *)initWithString:(NSString *)str
{
    return [super initWithString:str encoding:NSUTF8StringEncoding];
}


- (NSString *)avpType
{
    return @"UTF8String";
}

- (NSString *)value
{
    return [[NSString alloc] initWithData:_avpData encoding:NSUTF8StringEncoding];
}

- (void)setValue:(NSString *)v
{
    _avpData = [v dataUsingEncoding:NSUTF8StringEncoding];
}


- (NSNumber *)numberValue
{
    return @([self.value doubleValue]);
}

- (void)setNumberValue:(NSNumber *)n
{
    self.value = n.stringValue;
}


- (void)setDataValue:(NSData *)data
{
    _avpData = data;
}

- (void)setStringValue:(NSString *)string
{
    self.value = string;
}

- (void)setDictionaryValue:(NSDictionary *)dict
{
    self.value = [dict jsonString];
}

- (void)setDateValue:(NSDate *)date
{
    self.value = [date stringValue];
}

- (id)objectValue
{
    return self.value;
}

@end
