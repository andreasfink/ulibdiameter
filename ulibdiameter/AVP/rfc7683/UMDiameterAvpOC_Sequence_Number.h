//
//  UMDiameterAvpOC_Sequence_Number.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:16.191000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"



@interface UMDiameterAvpOC_Sequence_Number : UMDiameterAvpUnsigned64
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

