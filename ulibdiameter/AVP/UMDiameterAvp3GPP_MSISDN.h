//
//  UMDiameterAvpMSISDN.h
//  ulibdiameter
//
//  Created by Andreas Fink on 04.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"

@interface UMDiameterAvp3GPP_MSISDN : UMDiameterAvpOctetString

- (NSString *)value;
- (void)setValue:(NSString *)msisdn;
@end

