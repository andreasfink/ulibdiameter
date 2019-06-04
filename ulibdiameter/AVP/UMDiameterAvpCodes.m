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
        case UMDiameterAvpCode_FailedAvp:
            return @"Failed-AVP";
            break;
        case UMDiameterAvpCode_FirmwareRevision:
            return @"Firmware-Revision";
            break;
        case UMDiameterAvpCode_HostIpAddress:
            return @"Host-IP-Address";
            break;
        case UMDiameterAvpCode_InbandSecurityId:
            return @"Inband-Security-Id";
            break;
        case UMDiameterAvpCode_MultiRoundTimeout:
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
        case UMDiameterAvpCode_3GPP_User_Identity:
            return @"3GPP-User-Identity";
            break;
        case UMDiameterAvpCode_3GPP_MSISDN:
            return @"3GPP-MSISDN";
            break;
        case UMDiameterAvpCode_3GPP_User_Data:
            return @"3GPP-User-Data";
            break;
        case UMDiameterAvpCode_3GPP_Data_Reference:
            return @"3GPP-Data-Reference";
            break;
        case UMDiameterAvpCode_3GPP_Service_Indication:
            return @"3GPP-Service-Indication";
            break;
        case UMDiameterAvpCode_3GPP_Subs_Req_Type:
            return @"3GPP-Subs-Req-Type";
            break;
        case UMDiameterAvpCode_3GPP_Requested_Domain:
            return @"3GPP-Requested-Domain";
            break;
        case UMDiameterAvpCode_3GPP_Current_Location:
            return @"3GPP-Current-Location";
            break;
        case UMDiameterAvpCode_3GPP_Identity_Set:
            return @"3GPP-Identity-Set";
            break;
        case UMDiameterAvpCode_3GPP_Expiry_Time:
            return @"3GPP-Expiry-Time";
            break;
        case UMDiameterAvpCode_3GPP_Send_Data_Indication:
            return @"3GPP-Send-Data-Indication";
            break;
        case UMDiameterAvpCode_3GPP_Server_Name:
            return @"3GPP-Server-Name";
            break;
        case UMDiameterAvpCode_3GPP_Supported_Features:
            return @"3GPP-Supported-Features";
            break;
        case UMDiameterAvpCode_3GPP_Feature_List_ID:
            return @"3GPP-Feature-List-ID";
            break;
        case UMDiameterAvpCode_3GPP_Feature_List:
            return @"3GPP-Feature-List";
            break;
        case UMDiameterAvpCode_3GPP_Supported_Applications:
            return @"3GPP-Supported-Applications";
            break;
        case UMDiameterAvpCode_3GPP_Public_Identity:
            return @"3GPP-Public-Identity";
            break;
        case UMDiameterAvpCode_3GPP_DSAI_Tag:
            return @"3GPP-DSAI-Tag";
            break;
        case UMDiameterAvpCode_3GPP_Wildcarded_Public_Identity:
            return @"3GPP-Wildcarded-Public-Identity";
            break;
        case UMDiameterAvpCode_3GPP_Wildcarded_IMPU:
            return @"3GPP-Wildcarded-IMPU";
            break;
        case UMDiameterAvpCode_3GPP_Session_Priority:
            return @"3GPP-Session-Priority";
            break;
        case UMDiameterAvpCode_3GPP_One_Time_Notification:
            return @"3GPP-One-Time-Notification";
            break;
        case UMDiameterAvpCode_3GPP_Requested_Nodes:
            return @"3GPP-Requested-Nodes";
            break;
        case UMDiameterAvpCode_3GPP_Serving_Node_Indication:
            return @"3GPP-Serving-Node-Indication";
            break;
        case UMDiameterAvpCode_3GPP_Repository_Data_ID:
            return @"3GPP-Repository-Data-ID";
            break;
        case UMDiameterAvpCode_3GPP_Sequence_Number:
            return @"3GPP-Sequence-Number";
            break;
        case UMDiameterAvpCode_3GPP_Pre_paging_Supported:
            return @"3GPP-Pre-paging-Supported";
            break;
        case UMDiameterAvpCode_3GPP_Local_Time_Zone_Indication:
            return @"3GPP-Local-Time-Zone-Indication";
            break;
        case UMDiameterAvpCode_3GPP_UDR_Flags:
            return @"3GPP-UDR-Flags";
            break;
        case UMDiameterAvpCode_3GPP_Call_Reference_Info:
            return @"3GPP-Call-Reference-Info";
            break;
        case UMDiameterAvpCode_3GPP_Call_Reference_Number:
            return @"3GPP-Call-Reference-Number";
            break;
        case UMDiameterAvpCode_3GPP_AS_Number:
            return @"3GPP-AS-Number";
            break;
        case UMDiameterAvpCode_3GPP_OC_Supported_Features:
            return @"3GPP-OC-Supported-Features";
            break;
        case UMDiameterAvpCode_3GPP_DRMP:
            return @"3GPP-DRMP";
            break;
        default:
            return [NSString stringWithFormat:@"unknown(%d)",code ];
            break;

    }
}

