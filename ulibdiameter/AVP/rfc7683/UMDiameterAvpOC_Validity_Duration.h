//
//  UMDiameterAvpOC_Validity_Duration.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpOC_Validity_Duration : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

