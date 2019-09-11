//
//  UMDiameterAvpPeriodic_Time.h
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpTime.h"



@interface UMDiameterAvpPeriodic_Time : UMDiameterAvpTime
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

