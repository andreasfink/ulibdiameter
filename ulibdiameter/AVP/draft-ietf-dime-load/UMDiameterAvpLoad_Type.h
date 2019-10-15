//
//  UMDiameterAvpLoad_Type.h
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:30.744000
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

