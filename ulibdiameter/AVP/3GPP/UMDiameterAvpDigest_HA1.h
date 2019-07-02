//
//  UMDiameterAvpDigest_HA1.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"



@interface UMDiameterAvpDigest_HA1 : UMDiameterAvpUTF8String
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

