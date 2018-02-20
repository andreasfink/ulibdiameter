//
//  UMDiameterAvpCodes.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import "UMDiameterAvpCodes.h"


NSString *umdiameter_avp_code_string (UMDiameterAvpCode code)
{
    switch(code)
    {
        case UMDiameterAvpCode_AcctInterimInterval:
            return @"Acct-Interim-Interval";
            break;
        case UMDiameterAvpCode_AcctRealtimeRequired:
            return @"Accouting-Realtime-Required";
            break;
        case UMDiameterAvpCode_AcctMultiSessionId:
            return @"Acct-Multi-SessionId";
            break;
        case UMDiameterAvpCode_AcctRecordNumber:
            return @"Accounting-Record-Number";
            break;
        case UMDiameterAvpCode_AcctRecordType:
            return @"Accouting-Record-Type";
            break;
        case UMDiameterAvpCode_AcctSessionId:
            return @"Acct-Session-Id";
            break;
        case UMDiameterAvpCode_AcctSubSessionId:
            return @"Accounting-Sub-Session-Id";
            break;
        case UMDiameterAvpCode_AcctApplicationId:
            return @"AcctApplicationId";
            break;
        case UMDiameterAvpCode_AuthApplicationId:
            return @"Auth-Application-Id";
            break;
        case UMDiameterAvpCode_AuthRequestType:
            return @"Auth-Request-Type";
            break;
        case UMDiameterAvpCode_AuthorizationLifetime:
            return @"Authorization-Lifetime";
            break;
        case UMDiameterAvpCode_AuthGracePeriod:
            return @"Auth-Grace-Period";
            break;
        case UMDiameterAvpCode_AuthSessionState:
            return @"AuthSessionState";
            break;
        case UMDiameterAvpCode_ReAuthRequestType:
            return @"Re-Auth-Request-Type";
            break;
        case UMDiameterAvpCode_Class:
            return @"Class";
            break;
        case UMDiameterAvpCode_DestinationHost:
            return @"Destination-Host";
            break;
        case UMDiameterAvpCode_DestinationRealm:
            return @"Destination-Realm";
            break;
        case UMDiameterAvpCode_DisconnectCause:
            return @"Disconnect-Cause";
            break;
        case UMDiameterAvpCode_ErrorMessage:
            return @"Error-Message";
            break;
        case UMDiameterAvpCode_ErrorReportingHost:
            return @"Error-Reporting-Host";
            break;
        case UMDiameterAvpCode_EventTimestamp:
            return @"Event-Timestamp";
            break;
        case UMDiameterAvpCode_ExperimentalResult:
            return @"Experimental-Result";
            break;
        case UMDiameterAvpCode_ExperimentalResultCode:
            return @"Experimental-Result-Code";
            break;
        case UMDiameterAvpCode_FailedAVP:
            return @"Failed-AVP";
            break;
        case UMDiameterAvpCode_FirmwareRevision:
            return @"Firmware-Revision";
            break;
        case UMDiameterAvpCode_HostIPAddress:
            return @"Host-IP-Address";
            break;
        case UMDiameterAvpCode_InbandSecurityId:
            return @"Inband-Security-Id";
            break;
        case UMDiameterAvpCode_MultiRoundTimeOut:
            return @"Multi-Round-Time-Out";
            break;
        case UMDiameterAvpCode_OriginHost:
            return @"Origin-Host";
            break;
        case UMDiameterAvpCode_OriginRealm:
            return @"Origin-Realm";
            break;
        case UMDiameterAvpCode_OriginStateId:
            return @"Origin-State-Id";
            break;
        case UMDiameterAvpCode_ProductName:
            return @"Product-Name";
            break;
        case UMDiameterAvpCode_ProxyHost:
            return @"Proxy-Host";
            break;
        case UMDiameterAvpCode_ProxyInfo:
            return @"Proxy-Info";
            break;
        case UMDiameterAvpCode_ProxyState:
            return @"ProxyState";
            break;
        case UMDiameterAvpCode_RedirectHost:
            return @"Redirect-Host";
            break;
        case UMDiameterAvpCode_RedirectHostUsage:
            return @"Redirect-Host-Usage";
            break;
        case UMDiameterAvpCode_RedirectMaxCacheTime:
            return @"Redirect-Max-Cache-Time";
            break;
        case UMDiameterAvpCode_ResultCode:
            return @"Result-Code";
            break;
        case UMDiameterAvpCode_RouteRecord:
            return @"Route-Record";
            break;
        case UMDiameterAvpCode_SessionId:
            return @"Session-Id";
            break;
        case UMDiameterAvpCode_SessionTimeout:
            return @"Session-Timeout";
            break;
        case UMDiameterAvpCode_SessionBinding:
            return @"Session-Binding";
            break;
        case UMDiameterAvpCode_SessionServerFailover:
            return @"Session-Server-Failover";
            break;
        case UMDiameterAvpCode_SupportedVendorId:
            return @"Supported-Vendor-Id";
            break;
        case UMDiameterAvpCode_TerminationCause:
            return @"Termination-Cause";
            break;
        case UMDiameterAvpCode_UserName:
            return @"User-Name";
            break;
        case UMDiameterAvpCode_VendorId:
            return @"Vendor-Id";
            break;
        case UMDiameterAvpCode_VendorSpecificApplicationId:
            return @"Vendor-Specific-Application-Id";
            break;
        default:
            return [NSString stringWithFormat:@"unknown(%d)",code ];
            break;

    }
}

