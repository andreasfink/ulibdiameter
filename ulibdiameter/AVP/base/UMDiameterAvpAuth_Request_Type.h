//
//  UMDiameterAvpAuth_Request_Type.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpAuth_Request_Type : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

