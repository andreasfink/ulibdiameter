//
//  UMDiameterAvpDigest_Algorithm.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"



@interface UMDiameterAvpDigest_Algorithm : UMDiameterAvpUTF8String
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

