//
//  UMDiameterAvpOC_Validity_Duration.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:35.278000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpOC_Validity_Duration : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

