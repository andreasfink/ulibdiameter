//
//  UMDiameterAvpOC_Sequence_Number.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:19.099000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"



@interface UMDiameterAvpOC_Sequence_Number : UMDiameterAvpUnsigned64
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

