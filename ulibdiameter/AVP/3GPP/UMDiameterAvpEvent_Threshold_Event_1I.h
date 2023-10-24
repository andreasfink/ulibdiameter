//
//  UMDiameterAvpEvent_Threshold_Event_1I.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpInteger32.h"



@interface UMDiameterAvpEvent_Threshold_Event_1I : UMDiameterAvpInteger32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

