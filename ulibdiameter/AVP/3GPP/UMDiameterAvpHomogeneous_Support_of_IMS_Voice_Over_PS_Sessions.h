//
//  UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpHomogeneous_Support_of_IMS_Voice_Over_PS_Sessions : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

