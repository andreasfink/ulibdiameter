//
//  UMDiameterAvpMeasurement_Period_LTE.h
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"


@interface UMDiameterAvpMeasurement_Period_LTE : UMDiameterAvpEnumerated

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
@end

