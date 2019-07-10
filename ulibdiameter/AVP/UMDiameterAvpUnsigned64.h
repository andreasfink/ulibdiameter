//
//  UMDiameterAvpUnsigned64.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"

@interface UMDiameterAvpUnsigned64 : UMDiameterAvp

{
    uint64_t _value;
}

@property(readwrite,assign,atomic) uint64_t value;


- (NSNumber *)numberValue;
- (void)setNumberValue:(NSNumber *)n;

- (void)setStringValue:(NSString *)string;
- (NSString *)stringValue;


@end
