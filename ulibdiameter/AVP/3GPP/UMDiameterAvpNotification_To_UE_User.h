//
//  UMDiameterAvpNotification_To_UE_User.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpNotification_To_UE_User : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

