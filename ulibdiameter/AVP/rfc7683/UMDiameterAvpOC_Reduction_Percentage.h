//
//  UMDiameterAvpOC_Reduction_Percentage.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:15.553000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpOC_Reduction_Percentage : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

