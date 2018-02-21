//
//  UMDiameterAvpErrorReportingHost.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterIdentity.h"

/*
 7.4.  Error-Reporting-Host AVP

 The Error-Reporting-Host AVP (AVP Code 294) is of type
 DiameterIdentity.  This AVP contains the identity of the Diameter
 host that sent the Result-Code AVP to a value other than 2001
 (Success), only if the host setting the Result-Code is different from
 the one encoded in the Origin-Host AVP.  This AVP is intended to be
 used for troubleshooting purposes, and it MUST be set when the
 Result-Code AVP indicates a failure.
*/

@interface UMDiameterAvpErrorReportingHost : UMDiameterAvpDiameterIdentity

@end
