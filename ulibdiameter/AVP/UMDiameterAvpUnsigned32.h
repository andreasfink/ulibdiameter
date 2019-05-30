//
//  UMDiameterAvpUnsigned32.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"

@interface UMDiameterAvpUnsigned32 : UMDiameterAvp
{
    uint32_t _value;
}

@property(readwrite,assign,atomic) uint32_t value;

- (NSNumber *)number;
- (void)setNumber:(NSNumber *)n;

@end
