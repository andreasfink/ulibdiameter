//
//  UMDiameterAvpMaximum_UE_Availability_Time.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpTime.h"



@interface UMDiameterAvpMaximum_UE_Availability_Time : UMDiameterAvpTime
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

