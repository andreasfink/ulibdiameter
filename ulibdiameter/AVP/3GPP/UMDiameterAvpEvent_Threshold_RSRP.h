//
//  UMDiameterAvpEvent_Threshold_RSRP.h
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"


@interface UMDiameterAvpEvent_Threshold_RSRP : UMDiameterAvpUnsigned32

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
@end

