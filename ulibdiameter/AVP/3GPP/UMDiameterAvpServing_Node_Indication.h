//
//  UMDiameterAvpServing_Node_Indication.h
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:24.403000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpServing_Node_Indication : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

