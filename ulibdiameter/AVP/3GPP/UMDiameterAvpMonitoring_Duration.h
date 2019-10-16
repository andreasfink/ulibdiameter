//
//  UMDiameterAvpMonitoring_Duration.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpTime.h"



@interface UMDiameterAvpMonitoring_Duration : UMDiameterAvpTime
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

