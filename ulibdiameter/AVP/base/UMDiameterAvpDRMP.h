//
//  UMDiameterAvpDRMP.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 21:59:20.338000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpDRMP : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

