//
//  UMDiameterAvpOC_Feature_Vector.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:51:06.271000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"



@interface UMDiameterAvpOC_Feature_Vector : UMDiameterAvpUnsigned64
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

