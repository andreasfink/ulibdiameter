//
//  UMDiameterAvpTrace_Interface_List.h
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"


@interface UMDiameterAvpTrace_Interface_List : UMDiameterAvpOctetString

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
@end

