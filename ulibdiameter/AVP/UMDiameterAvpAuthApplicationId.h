//
//  UMDiameterAvpAuthApplicationId.h
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"

@interface UMDiameterAvpAuthApplicationId : UMDiameterAvpUnsigned32

+ (uint32_t)avpCode;
- (uint32_t)avpCode;

- (UMDiameterAvpAuthApplicationId *)initWithString:(NSString *)str;
- (NSString *)string;
- (void)setString:(NSString *)s;
@end
