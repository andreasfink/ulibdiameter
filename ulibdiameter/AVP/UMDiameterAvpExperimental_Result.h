//
//  UMDiameterAvpExperimental_Result.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

/*
 7.6.  Experimental-Result AVP

 The Experimental-Result AVP (AVP Code 297) is of type Grouped, and
 indicates whether a particular vendor-specific request was completed
 successfully or whether an error occurred.  This AVP has the
 following structure:

 AVP Format

 Experimental-Result ::= < AVP Header: 297 >
 { Vendor-Id }
 { Experimental-Result-Code }

 The Vendor-Id AVP (see Section 5.3.3) in this grouped AVP identifies
 the vendor responsible for the assignment of the result code that
 follows.  All Diameter answer messages defined in vendor-specific
 applications MUST include either one Result-Code AVP or one
 Experimental-Result AVP.

*/

@interface UMDiameterAvpExperimental_Result : UMDiameterAvpGrouped

@end
