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

- (NSNumber *)number;
- (void)setNumber:(NSNumber *)n;


@end
