//
//  UMDiameterAvp3GPP_AIR_Flags.h
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"


@interface UMDiameterAvp3GPP_AIR_Flags : UMDiameterAvp
- (NSString *)value;
- (void)setValue:(NSString *)str;

@end
