//
//  UMDiameterAvpUE_PC5_AMBR.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpUE_PC5_AMBR : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

