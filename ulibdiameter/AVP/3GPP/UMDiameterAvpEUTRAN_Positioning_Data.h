//
//  UMDiameterAvpEUTRAN_Positioning_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"



@interface UMDiameterAvpEUTRAN_Positioning_Data : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

