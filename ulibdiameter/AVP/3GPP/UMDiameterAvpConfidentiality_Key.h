//
//  UMDiameterAvpConfidentiality_Key.h
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.459000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"



@interface UMDiameterAvpConfidentiality_Key : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

