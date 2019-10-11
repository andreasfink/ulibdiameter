//
//  UMDiameterAvpOctetString.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"

@interface UMDiameterAvpOctetString : UMDiameterAvp


- (void)setStringValue:(NSString *)string;
- (NSString *)stringValue;
- (UMDiameterAvpOctetString *)initWithString:(NSString *)str encoding:(NSStringEncoding)encoding;

@end
