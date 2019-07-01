//
//  UMDiameterAvpNumber_Of_Requested_Vectors.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpNumber_Of_Requested_Vectors : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

