//
//  UMDiameterAvpMeasurement_Period_LTE.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpMeasurement_Period_LTE : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

