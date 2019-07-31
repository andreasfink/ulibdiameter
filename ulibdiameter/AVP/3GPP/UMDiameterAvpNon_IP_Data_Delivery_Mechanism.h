//
//  UMDiameterAvpNon_IP_Data_Delivery_Mechanism.h
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.459000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpNon_IP_Data_Delivery_Mechanism : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

