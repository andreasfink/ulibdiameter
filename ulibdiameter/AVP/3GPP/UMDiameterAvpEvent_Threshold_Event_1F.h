//
//  UMDiameterAvpEvent_Threshold_Event_1F.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpInteger32.h"



@interface UMDiameterAvpEvent_Threshold_Event_1F : UMDiameterAvpInteger32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

