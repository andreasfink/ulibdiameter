//
//  UMDiameterAvpOctetString.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>

@interface UMDiameterAvpOctetString : UMDiameterAvp


- (void)setDataValue:(NSData *)data;
- (NSData *)dataValue;

- (void)setMsisdn:(NSString *)string;
- (NSString *)msisdn;
- (UMDiameterAvpOctetString *)initWithMsisdnString:(NSString *)str;

+ (NSString *) decodeMsisdn:(NSData *)data;
+ (NSData *)encodeMsisdn:(NSString *)str;

- (void)setStringValue:(NSString *)string;
- (NSString *)stringValue;
- (UMDiameterAvpOctetString *)initWithString:(NSString *)str encoding:(NSStringEncoding)encoding;

@end
