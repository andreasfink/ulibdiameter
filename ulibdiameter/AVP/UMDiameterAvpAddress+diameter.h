//
//  UMDiameterAvpAddress+diameter.h
//  ulibdiameter
//
//  Created by Andreas Fink on 13.10.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvpAddress.h>

@interface UMDiameterAvpAddress (diameter)

- (void)setStringValue:(NSString *)str;
- (NSString *)stringValue;

@end

