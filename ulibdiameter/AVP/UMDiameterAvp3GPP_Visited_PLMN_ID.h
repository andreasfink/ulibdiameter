//
//  UMDiameterAvp3GPP_Visited_PLMN_ID.h
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"


@interface UMDiameterAvp3GPP_Visited_PLMN_ID : UMDiameterAvp

- (NSString *)value;
- (void)setValue:(NSString *)str;

@end
