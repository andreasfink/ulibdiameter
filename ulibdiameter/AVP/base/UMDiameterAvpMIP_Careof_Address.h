//
//  UMDiameterAvpMIP_Careof_Address.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress.h"



@interface UMDiameterAvpMIP_Careof_Address : UMDiameterAvpAddress
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

