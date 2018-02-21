//
//  UMDiameterAvpErrorMessage.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"
/*

 7.3.  Error-Message AVP

 The Error-Message AVP (AVP Code 281) is of type UTF8String.  It MAY
 accompany a Result-Code AVP as a human-readable error message.  The
 Error-Message AVP is not intended to be useful in an environment
 where error messages are processed automatically.  It SHOULD NOT be
 expected that the content of this AVP be parsed by network entities.

 */

@interface UMDiameterAvpErrorMessage : UMDiameterAvpUTF8String

@end
