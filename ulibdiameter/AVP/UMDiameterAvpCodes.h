//
//  UMDiameterAvpCodes.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

typedef enum UMDiameterAvpCode
{
    UMDiameterAvpCode_AcctInterimInterval = 85,
    UMDiameterAvpCode_AcctRealtimeRequired = 483,
    UMDiameterAvpCode_AcctMultiSessionId = 50,
    UMDiameterAvpCode_AcctRecordNumber = 485,
    UMDiameterAvpCode_AcctRecordType = 480,
    UMDiameterAvpCode_AcctSessionId = 44,
    UMDiameterAvpCode_AcctSubSessionId = 287,
    UMDiameterAvpCode_AcctApplicationId = 259,
    UMDiameterAvpCode_AuthApplicationId = 258,
    UMDiameterAvpCode_AuthRequestType = 274,
    UMDiameterAvpCode_AuthorizationLifetime = 291,
    UMDiameterAvpCode_AuthGracePeriod = 276,
    UMDiameterAvpCode_AuthSessionState = 277,
    UMDiameterAvpCode_ReAuthRequestType = 285,
    UMDiameterAvpCode_Class = 25,
    UMDiameterAvpCode_DestinationHost = 293,
    UMDiameterAvpCode_DestinationRealm = 283,
    UMDiameterAvpCode_DisconnectCause = 273,
    UMDiameterAvpCode_ErrorMessage = 281,
    UMDiameterAvpCode_ErrorReportingHost = 294,
    UMDiameterAvpCode_EventTimestamp = 55,
    UMDiameterAvpCode_ExperimentalResult = 297,
    UMDiameterAvpCode_ExperimentalResultCode = 298,
    UMDiameterAvpCode_FailedAvp = 279,
    UMDiameterAvpCode_FirmwareRevision = 267,
    UMDiameterAvpCode_HostIpAddress = 257,
    UMDiameterAvpCode_InbandSecurityId = 299,
    UMDiameterAvpCode_MultiRoundTimeout = 272,
    UMDiameterAvpCode_OriginHost = 264,
    UMDiameterAvpCode_OriginRealm = 296,
    UMDiameterAvpCode_OriginStateId = 278,
    UMDiameterAvpCode_ProductName = 269,
    UMDiameterAvpCode_ProxyHost = 280,
    UMDiameterAvpCode_ProxyInfo = 284,
    UMDiameterAvpCode_ProxyState = 33,
    UMDiameterAvpCode_RedirectHost = 292,
    UMDiameterAvpCode_RedirectHostUsage = 261,
    UMDiameterAvpCode_RedirectMaxCacheTime = 262,
    UMDiameterAvpCode_ResultCode = 268,
    UMDiameterAvpCode_RouteRecord = 282,
    UMDiameterAvpCode_SessionId = 263,
    UMDiameterAvpCode_SessionTimeout = 27,
    UMDiameterAvpCode_SessionBinding = 270,
    UMDiameterAvpCode_SessionServerFailover = 271,
    UMDiameterAvpCode_SupportedVendorId = 265,
    UMDiameterAvpCode_TerminationCause = 295,
    UMDiameterAvpCode_UserName = 1,
    UMDiameterAvpCode_VendorId = 266,
    UMDiameterAvpCode_VendorSpecificApplicationId = 260,
    
    /* From 3GPP TS 29.329 version 15.1.0 Release 15 15 ETSI TS 129 329 V15.1.0 (2018-07)
     Section 6.3
     */
    UMDiameterAvpCode_3GPP_User_Identity = 700,
    UMDiameterAvpCode_3GPP_MSISDN = 701,
    UMDiameterAvpCode_3GPP_User_Data = 702,
    UMDiameterAvpCode_3GPP_Data_Reference = 703,
    UMDiameterAvpCode_3GPP_Service_Indication = 704,
    UMDiameterAvpCode_3GPP_Subs_Req_Type = 705,
    UMDiameterAvpCode_3GPP_Requested_Domain = 706,
    UMDiameterAvpCode_3GPP_Current_Location = 707,
    UMDiameterAvpCode_3GPP_Identity_Set = 708,
    UMDiameterAvpCode_3GPP_Expiry_Time = 709,
    UMDiameterAvpCode_3GPP_Send_Data_Indication = 710,
    UMDiameterAvpCode_3GPP_Server_Name = 602,
    UMDiameterAvpCode_3GPP_Supported_Features = 628,
    UMDiameterAvpCode_3GPP_Feature_List_ID = 629,
    UMDiameterAvpCode_3GPP_Feature_List = 630,
    UMDiameterAvpCode_3GPP_Supported_Applications = 631,
    UMDiameterAvpCode_3GPP_Public_Identity = 601,
    UMDiameterAvpCode_3GPP_DSAI_Tag = 711,
    UMDiameterAvpCode_3GPP_Wildcarded_Public_Identity = 634,
    UMDiameterAvpCode_3GPP_Wildcarded_IMPU = 636,
    UMDiameterAvpCode_3GPP_Session_Priority = 650,
    UMDiameterAvpCode_3GPP_One_Time_Notification = 712,
    UMDiameterAvpCode_3GPP_Requested_Nodes = 713,
    UMDiameterAvpCode_3GPP_Serving_Node_Indication = 714,
    UMDiameterAvpCode_3GPP_Repository_Data_ID = 715,
    UMDiameterAvpCode_3GPP_Sequence_Number = 716,
    UMDiameterAvpCode_3GPP_Pre_paging_Supported = 717,
    UMDiameterAvpCode_3GPP_Local_Time_Zone_Indication = 718,
    UMDiameterAvpCode_3GPP_UDR_Flags = 719,
    UMDiameterAvpCode_3GPP_Call_Reference_Info = 720,
    UMDiameterAvpCode_3GPP_Call_Reference_Number = 721,
    UMDiameterAvpCode_3GPP_AS_Number = 722,
    UMDiameterAvpCode_3GPP_OC_Supported_Features = 621,
    UMDiameterAvpCode_DRMP = 301,

    /* THS 29.338 page 43 */
    UMDiameterAvpCode_3GPP_SC_Address = 3300,
    UMDiameterAvpCode_SM_RP_UI = 3301,
    UMDiameterAvpCode_TFR_Flags = 3302,
    UMDiameterAvpCode_SM_Delivery_Failure_Cause = 3303,
    UMDiameterAvpCode_SM_Enumerated_Delivery_Failure_Cause = 3304,
    UMDiameterAvpCode_SM_Diagnostic_Info = 3305,
    UMDiameterAvpCode_SM_Delivery_Timer = 3306,
    UMDiameterAvpCode_SM_Delivery_Start_Time = 3307,
    UMDiameterAvpCode_SMSMI_Correlation_ID = 3324,
    UMDiameterAvpCode_HSS_ID = 3325,
    UMDiameterAvpCode_Originating_SIP_URI = 3326,
    UMDiameterAvpCode_Destination_SIP_URI = 3327,
    UMDiameterAvpCode_OFR_Flags = 3328,
    UMDiameterAvpCode_Maximum_Retransmission_Time = 3330,
    UMDiameterAvpCode_Requested_Retransmission_Time = 3331,
    UMDiameterAvpCode_SMS_GMSC_Address = 3332,

    UMDiameterAvpCode_AIR_Flags = 0xFFFF, /* unknown yet */
    UMDiameterAvpCode_3GPP_Serving_Node = 2401, /* to be verified */
    UMDiameterAvpCode_3GPP_Additional_Serving_Node = 2406, /* to be verified */

} UMDiameterAvpCode;

NSString *umdiameter_avp_code_string (UMDiameterAvpCode code);
