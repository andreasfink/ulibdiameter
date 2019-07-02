//
//  UMDiameterAvpChargeable_User_Identity.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:31:41.274000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"



@interface UMDiameterAvpChargeable_User_Identity : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

