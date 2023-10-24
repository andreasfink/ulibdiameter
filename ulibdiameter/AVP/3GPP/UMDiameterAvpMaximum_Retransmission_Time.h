//
//  UMDiameterAvpMaximum_Retransmission_Time.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 09:10:42.728611
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpTime.h"



@interface UMDiameterAvpMaximum_Retransmission_Time : UMDiameterAvpTime
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

