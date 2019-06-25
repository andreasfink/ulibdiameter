//
//  UMDiameterAvpDRMP.h
//  ulibdiameter
//
//  Created by Andreas Fink on 07.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"


@interface UMDiameterAvpDRMP : UMDiameterAvpEnumerated

- (NSString *)stringValue;
- (void)setStringValue:(NSString *)str;
- (UMDiameterAvpDRMP *)initWithString:(NSString *)str;
@end

