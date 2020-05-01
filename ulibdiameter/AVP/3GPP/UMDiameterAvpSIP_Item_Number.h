//
//  UMDiameterAvpSIP_Item_Number.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 09:07:17.109158
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpSIP_Item_Number : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

