//
//  UMDiameterAvpFloat32.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright (c) 2026 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>

@interface UMDiameterAvpFloat32 : UMDiameterAvp
{
    float _value;
}

@property(readwrite,assign,atomic) float value;

@end
