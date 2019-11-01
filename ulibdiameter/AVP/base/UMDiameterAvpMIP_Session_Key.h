//
//  UMDiameterAvpMIP_Session_Key.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"



@interface UMDiameterAvpMIP_Session_Key : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

