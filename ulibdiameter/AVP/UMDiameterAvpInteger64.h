//
//  UMDiameterAvpInteger64.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"

@interface UMDiameterAvpInteger64 : UMDiameterAvp
{
    int64_t _value;
}

@property(readwrite,assign,atomic) int64_t value;

- (UMDiameterAvpInteger64 *)initWithNumber:(NSNumber *)n;
- (UMDiameterAvpInteger64 *)initWithString:(NSString *)s;

- (NSNumber *)numberValue;
- (void)setNumberValue:(NSNumber *)n;

- (void)setStringValue:(NSString *)string;
- (NSString *)stringValue;

@end
