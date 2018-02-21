//
//  UMDiameterService.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterService.h"

@implementation UMDiameterService


/*

8.3.  Server-Initiated Re-Auth

   A Diameter server may initiate a re-authentication and/or re-
   authorization service for a particular session by issuing a Re-Auth-
   Request (RAR).

   For example, for prepaid services, the Diameter server that
   originally authorized a session may need some confirmation that the
   user is still using the services.

   An access device that receives an RAR message with the Session-Id
   equal to a currently active session MUST initiate a re-auth towards
   the user, if the service supports this particular feature.  Each
   Diameter application MUST state whether server-initiated re-auth is
   supported, since some applications do not allow access devices to
   prompt the user for re-auth.

8.3.1.  Re-Auth-Request

   The Re-Auth-Request (RAR), indicated by the Command Code set to 258
   and the message flags' 'R' bit set, may be sent by any server to the
   access device that is providing session service, to request that the
   user be re-authenticated and/or re-authorized.


    Message Format

         <RAR>  ::= < Diameter Header: 258, REQ, PXY >
                    < Session-Id >
                    { Origin-Host }
                    { Origin-Realm }
                    { Destination-Realm }
                    { Destination-Host }
                    { Auth-Application-Id }
                    { Re-Auth-Request-Type }
                    [ User-Name ]
                    [ Origin-State-Id ]
                  * [ Proxy-Info ]
                  * [ Route-Record ]
                  * [ AVP ]
*/


- (void)sendRAR
{

}

- (void)cleanup
{

}

- (void)updateSession
{

}

- (void)sendASR
{

}

- (void)sendSTA
{

}

@end
