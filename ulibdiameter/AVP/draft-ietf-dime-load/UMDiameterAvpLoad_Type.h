//
//  UMDiameterAvpLoad_Type.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 14:58:19.923000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpLoad_Type : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

