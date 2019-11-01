//
//  UMDiameterAvpEvent_Timestamp.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpTime.h"



@interface UMDiameterAvpEvent_Timestamp : UMDiameterAvpTime
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

