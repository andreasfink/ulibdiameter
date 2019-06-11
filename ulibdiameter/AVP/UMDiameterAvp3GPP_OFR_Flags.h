//
//  UMDiameterAvp3GPP_OFR_Flags.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"


@interface UMDiameterAvp3GPP_OFR_Flags : UMDiameterAvpUnsigned32


- (BOOL)isSentOnGddInterface;
- (void) setSentOnGddInterface:(BOOL)flag;

@end

