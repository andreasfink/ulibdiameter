//
//  UMDiameterAvpMIP_Careof_Address.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress.h"



@interface UMDiameterAvpMIP_Careof_Address : UMDiameterAvpAddress
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

