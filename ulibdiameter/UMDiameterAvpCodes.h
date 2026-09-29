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
    UMDiameterAvpCode_Acct_Interim_Interval = 85,
    UMDiameterAvpCode_Acct_Realtime_Required = 483,
    UMDiameterAvpCode_Acct_Multi_Session_Id = 50,
    UMDiameterAvpCode_Acct_Record_Number = 485,
    UMDiameterAvpCode_Acct_Record_Type = 480,
    UMDiameterAvpCode_Acct_Session_Id = 44,
    UMDiameterAvpCode_Acct_Sub_Session_Id = 287,
    UMDiameterAvpCode_Acct_Application_Id = 259,
    UMDiameterAvpCode_Auth_Application_Id = 258,
    UMDiameterAvpCode_Auth_Request_Type = 274,
    UMDiameterAvpCode_Authorization_Lifetime = 291,
    UMDiameterAvpCode_Auth_Grace_Period = 276,
    UMDiameterAvpCode_Auth_Session_State = 277,
    UMDiameterAvpCode_Re_Auth_Request_Type = 285,
    UMDiameterAvpCode_Class = 25,
    UMDiameterAvpCode_Destination_Host = 293,
    UMDiameterAvpCode_Destination_Realm = 283,
    UMDiameterAvpCode_Disconnect_Cause = 273,
    UMDiameterAvpCode_Error_Message = 281,
    UMDiameterAvpCode_Error_Reporting_Host = 294,
    UMDiameterAvpCode_Event_Timestamp = 55,
    UMDiameterAvpCode_Experimental_Result = 297,
    UMDiameterAvpCode_Experimental_ResultCode = 298,
    UMDiameterAvpCode_Failed_Avp = 279,
    UMDiameterAvpCode_Firmware_Revision = 267,
    UMDiameterAvpCode_Host_Ip_Address = 257,
    UMDiameterAvpCode_Inband_Security_Id = 299,
    UMDiameterAvpCode_Multi_Round_Timeout = 272,
    UMDiameterAvpCode_Origin_Host = 264,
    UMDiameterAvpCode_Origin_Realm = 296,
    UMDiameterAvpCode_Origin_StateId = 278,
    UMDiameterAvpCode_Product_Name = 269,
    UMDiameterAvpCode_Proxy_Host = 280,
    UMDiameterAvpCode_Proxy_Info = 284,
    UMDiameterAvpCode_Proxy_State = 33,
    UMDiameterAvpCode_Redirect_Host = 292,
    UMDiameterAvpCode_Redirect_Host_Usage = 261,
    UMDiameterAvpCode_Redirect_Max_Cache_Time = 262,
    UMDiameterAvpCode_Result_Code = 268,
    UMDiameterAvpCode_Route_Record = 282,
    UMDiameterAvpCode_Session_Id = 263,
    UMDiameterAvpCode_Session_Timeout = 27,
    UMDiameterAvpCode_Session_Binding = 270,
    UMDiameterAvpCode_Session_Server_Failover = 271,
    UMDiameterAvpCode_Supported_Vendor_Id = 265,
    UMDiameterAvpCode_Termination_Cause = 295,
    UMDiameterAvpCode_User_Name = 1,
    UMDiameterAvpCode_Vendor_Id = 266,
    UMDiameterAvpCode_Vendor_Specific_Application_Id = 260,
    
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

    /* 3GPP 29.336 */
    UMDiameterAvpCode_3GPP_IP_SM_GW_Number = 3100,
    UMDiameterAvpCode_3GPP_IP_SM_GW_Name = 3101,
    UMDiameterAvpCode_3GPP_User_Identifier = 3102,
    UMDiameterAvpCode_3GPP_Service_ID = 3103,
    UMDiameterAvpCode_3GPP_SCS_Identity = 3104,
    UMDiameterAvpCode_3GPP_Service_Parameters = 3105,
    UMDiameterAvpCode_3GPP_T4_Parameters = 3106,
    UMDiameterAvpCode_3GPP_Service_Data = 3107,
    UMDiameterAvpCode_3GPP_T4_Data = 3108,
    UMDiameterAvpCode_3GPP_HSS_Cause =3109,
    UMDiameterAvpCode_3GPP_SIR_Flags = 3110,
    UMDiameterAvpCode_3GPP_External_Identifier = 3111,
    UMDiameterAvpCode_3GPP_IP_SM_GW_Realm = 3112,
} UMDiameterAvpCode;

NSString *umdiameter_avp_code_string (UMDiameterAvpCode code);
