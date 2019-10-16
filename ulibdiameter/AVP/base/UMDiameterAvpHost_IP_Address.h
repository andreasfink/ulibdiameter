//
//  UMDiameterAvpHost_IP_Address.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:20.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress.h"



@interface UMDiameterAvpHost_IP_Address : UMDiameterAvpAddress
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

