//
//  UMDiameterAvpUTF8String.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright (c) 2026 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpOctetString.h>

@interface UMDiameterAvpUTF8String : UMDiameterAvpOctetString

- (NSString *)value;
- (void)setValue:(NSString *)v;
- (UMDiameterAvpUTF8String *)initWithString:(NSString *)str;

@end
