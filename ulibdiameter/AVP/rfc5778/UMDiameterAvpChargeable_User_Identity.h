//
//  UMDiameterAvpChargeable_User_Identity.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:28:22.488000
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

