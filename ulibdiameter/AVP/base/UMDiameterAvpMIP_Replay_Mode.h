//
//  UMDiameterAvpMIP_Replay_Mode.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.128000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpMIP_Replay_Mode : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

