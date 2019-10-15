//
//  UMDiameterAvpPDP_Address.h
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress.h"



@interface UMDiameterAvpPDP_Address : UMDiameterAvpAddress
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

