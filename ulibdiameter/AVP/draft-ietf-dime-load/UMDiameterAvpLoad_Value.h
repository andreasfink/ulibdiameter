//
//  UMDiameterAvpLoad_Value.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:19.065000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"



@interface UMDiameterAvpLoad_Value : UMDiameterAvpUnsigned64
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

