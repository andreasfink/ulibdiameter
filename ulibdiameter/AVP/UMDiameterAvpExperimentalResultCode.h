//
//  UMDiameterAvpExperimentalResultCode.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"

/*
7.7.  Experimental-Result-Code AVP

The Experimental-Result-Code AVP (AVP Code 298) is of type Unsigned32
and contains a vendor-assigned value representing the result of
processing the request.

It is recommended that vendor-specific result codes follow the same
conventions given for the Result-Code AVP regarding the different
types of result codes and the handling of errors (for non-2xxx
                                                  values).

*/

@interface UMDiameterAvpExperimentalResultCode : UMDiameterAvpUnsigned32

@end
