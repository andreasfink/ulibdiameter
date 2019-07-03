//
//  UMDiameterAvpLoad_Value.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 14:58:19.923000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"



@interface UMDiameterAvpLoad_Value : UMDiameterAvpUnsigned64
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

