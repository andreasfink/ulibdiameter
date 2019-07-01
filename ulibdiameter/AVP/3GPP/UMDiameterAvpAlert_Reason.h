//
//  UMDiameterAvpAlert_Reason.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerate.h"



@interface UMDiameterAvpAlert_Reason : UMDiameterAvpEnumerate
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

