//
//  UMDiameterService.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterService.h"
#import "UMDiameterPacket.h"
#import "UMDiameterAvpAll.h"

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
    UMDiameterPacket *packet = [[UMDiameterPacket alloc]init];
    packet.version = 1;
    packet.commandFlags = UMDiameterCommandFlag_Request | UMDiameterCommandFlag_Proxyable;
    packet.commandCode = UMDiameterCommandCode_Re_Auth;
    packet.applicationId = self.applicationId;
    packet.hopByHopIdentifier = self.hopByHopIdentifier;
    packet.endToEndIdentifier = self.endToEndIdentifier;

    /* FIXED PART */
    UMDiameterAvpSessionId *avp_session = [[UMDiameterAvpSessionId alloc]init];
    avp_session.value = _sessionId;

    /* REQUIRED PART */
    UMDiameterAvpOriginHost *avp_origin_host = [[UMDiameterAvpOriginHost alloc]init];
    avp_origin_host.avpData = self.localDiameterIdentity;
    [packet appendAvp:avp_origin_host];

    UMDiameterAvpOriginRealm *avp_origin_realm = [[UMDiameterAvpOriginRealm alloc]init];
    avp_origin_realm.avpData = self.originRealm;
    [packet appendAvp:avp_origin_realm];

    UMDiameterAvpDestinationRealm *avp_destination_realm = [[UMDiameterAvpDestinationRealm alloc]init];
    avp_destination_realm.avpData = self.destinationRealm;
    [packet appendAvp:avp_origin_realm];

    UMDiameterAvpDestinationHost *avp_destination_host = [[UMDiameterAvpDestinationHost alloc]init];
    avp_destination_host.avpData = self.destinationHost;
    [packet appendAvp:avp_origin_host];

    UMDiameterAvpAuthApplicationId *avp_auth_app_id = [[UMDiameterAvpAuthApplicationId alloc]init];
    avp_auth_app_id.value = self.authAppId;
    [packet appendAvp:avp_auth_app_id];

    UMDiameterAvpReAuthRequestType *avp_re_auth_request_type = [[UMDiameterAvpReAuthRequestType alloc]init];
    avp_re_auth_request_type.value = 0; /* FIXME: What value? */
    [packet appendAvp:avp_re_auth_request_type];

    /* OPTIONAL PART */
    if(self.optional_userName.length > 0)
    {
        UMDiameterAvpUserName *avp_user_name = [[UMDiameterAvpUserName alloc]init];
        avp_user_name.value = self.optional_userName;
        [packet appendAvp:avp_user_name];
    }
    if(self.optional_OriginStateId )
    {
        UMDiameterAvpOriginStateId *avp_orign_state_id = [[UMDiameterAvpOriginStateId alloc]init];
        avp_orign_state_id.number = self.optional_OriginStateId;
        [packet appendAvp:avp_orign_state_id];
    }

    NSInteger n = _optional_ProxyInfos.count;
    if(n > 0)
    {
        for(NSInteger i=0;i<n;i++)
        {
            UMDiameterAvpProxyInfo *pi = _optional_ProxyInfos[i];
            [packet appendAvp:pi];

        }
    }
    n = _optional_routeRecords.count;
    if(n > 0)
    {
        for(NSInteger i=0;i<n;i++)
        {
            UMDiameterAvpDiameterIdentity *di = _optional_routeRecords[i];
            [packet appendAvp:di];
        }
    }
    n = _optional_AVPs.count;
    if( n  > 0)
    {
        for(NSInteger i=0;i<n;i++)
        {
            UMDiameterAvp *avp = _optional_routeRecords[i];
            [packet appendAvp:avp];
        }
    }

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
