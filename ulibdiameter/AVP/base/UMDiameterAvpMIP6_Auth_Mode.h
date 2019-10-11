//
//  UMDiameterAvpMIP6_Auth_Mode.h
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:28.749000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpMIP6_Auth_Mode : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

