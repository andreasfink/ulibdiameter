//
//  UMDiameterAvpHost_IP_Address.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:00:34.245000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress.h"



@interface UMDiameterAvpHost_IP_Address : UMDiameterAvpAddress
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

