//
//  UMDiameterAvpEvent_Timestamp.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:15.505910
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

