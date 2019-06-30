//
//  UMDiameterAvpSGs_MME_Identity.h
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"


@interface UMDiameterAvpSGs_MME_Identity : UMDiameterAvpUTF8String

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
@end

