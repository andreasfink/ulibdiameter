//
//  UMDiameterAvpDay_Of_Week_Mask.h
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:52:18.180000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpDay_Of_Week_Mask : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

