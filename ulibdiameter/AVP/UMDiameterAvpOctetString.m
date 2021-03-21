//
//  UMDiameterAvpOctetString.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"


static int digit_to_nibble(int digit);
static unsigned char nibble2hex(unsigned char b);

static inline int digit_to_nibble(int digit)
{
    switch(digit)
    {
        case '0':
            return 0;
        case '1':
            return 1;
        case '2':
            return 2;
        case '3':
            return 3;
        case '4':
            return 4;
        case '5':
            return 5;
        case '6':
            return 6;
        case '7':
            return 7;
        case '8':
            return 8;
        case '9':
            return 9;
        case '*':
            return 0x0B;
        case '#':
            return 0x0C;
    }
    return -1;
}

static inline unsigned char    nibble2hex(unsigned char b)
{
    if(b < 0x0A)
    {
        return '0'+ b;
    }
    else
    {
        return 'A'+ b - 0x0A;
    }
}


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

- (NSData *)dataValue
{
    return _avpData;
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


- (UMDiameterAvpOctetString *)initWithString:(NSString *)str
                                    encoding:(NSStringEncoding)encoding;
{
    NSData *d = [str dataUsingEncoding:encoding];
    self = [super init];
    if(self)
    {
        [self setDataValue:d];
    }
    return self;
}


- (void)setMsisdn:(NSString *)string
{
    NSData *d = [UMDiameterAvpOctetString encodeMsisdn:string];
    [self setDataValue:d];
}

- (NSString *)msisdn
{
    NSString *s = [UMDiameterAvpOctetString decodeMsisdn:[self dataValue]];
    return s;
}

- (UMDiameterAvpOctetString *)initWithMsisdnString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        [self setMsisdn:str];
    }
    return self;
}

+ (NSData *) encodeMsisdn:(NSString *)msisdn
{
    NSMutableData *data = [[NSMutableData alloc]init];
    int c1 = 0;
    int c2 = 0;
    int c;
    NSData *ad = [msisdn dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger len = ad.length;
    const uint8_t *bytes = ad.bytes;
    int odd = len % 2;
    for(int i=0;i<len;i++)
    {
        if( (i % 2) == 0)
        {
            c1 = digit_to_nibble(bytes[i]);
        }
        else
        {
            c2 = digit_to_nibble(bytes[i]);
            c = (unsigned char)((c2 << 4) | c1);
            [data appendByte:c];
        }
    }
    if(odd)
    {
        c2 = 0x0F;
        c = (unsigned char)((c2 << 4) | c1);
        [data appendByte:c];
    }
    return data;
}

+ (NSString *) decodeMsisdn:(NSData *)data
{
    unsigned char c;
    unsigned char a;
    unsigned char b;
    
    const char *str = data.bytes;
    NSUInteger len = data.length;
    NSMutableData *tmp = [[NSMutableData alloc]init];
    for(NSUInteger pos=0;pos<len;pos++)
    {
        c = str[pos++];
        a =  c & 0x0F;
        b =  ((c & 0xF0) >> 4);
        
        if(b == 0x0F)
        {
            [tmp appendByte:nibble2hex(a)];
            break;
        }
        else
        {
            [tmp appendByte:nibble2hex(a)];
            [tmp appendByte:nibble2hex(b)];
        }
    }
    NSString *msisdn = [[NSString alloc]initWithData:tmp encoding:NSUTF8StringEncoding];
    return msisdn;
}
@end
