//
//  UMDiameterAvpFloat64.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/ulibdiameter.h>

@interface UMDiameterAvpFloat64 : UMDiameterAvp
{
    double _value;
}

@property(readwrite,assign,atomic) double value;

@end
