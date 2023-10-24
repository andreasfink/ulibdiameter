//
//  UMDiameterAvpUTF8String.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"

@interface UMDiameterAvpUTF8String : UMDiameterAvpOctetString

- (NSString *)value;
- (void)setValue:(NSString *)v;
- (UMDiameterAvpUTF8String *)initWithString:(NSString *)str;

@end
