//
//  UMDiameterAvpInteger32.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/ulibdiameter.h>

@interface UMDiameterAvpInteger32 : UMDiameterAvp
{
    int32_t _value;
}

@property(readwrite,assign,atomic) int32_t value;

@end
