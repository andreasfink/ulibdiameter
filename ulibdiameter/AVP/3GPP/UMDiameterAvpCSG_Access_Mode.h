//
//  UMDiameterAvpCSG_Access_Mode.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpM,V.h"



@interface UMDiameterAvpCSG_Access_Mode : UMDiameterAvpM,V
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

