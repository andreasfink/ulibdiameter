//
//  UMDiameterAvpIDR_Flags.h
//  ulibdiameter
//
//  Created by afink on 2021-03-22 14:38:56.701143
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpIDR_Flags : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

