//
//  UMDiameterCommandCode.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//


 
 
typedef enum UMDiameterCommandCode
{
    
    UMDiameterCommandCode_AA = 265,
    UMDiameterCommandCode_DE = 268,
    UMDiameterCommandCode_AS = 274,
    UMDiameterCommandCode_AC = 271,
    UMDiameterCommandCode_CC = 272,
    UMDiameterCommandCode_CE = 257,
    UMDiameterCommandCode_DW = 280,
    UMDiameterCommandCode_DP = 282,
    UMDiameterCommandCode_RA = 258,
    UMDiameterCommandCode_ST = 275,
    UMDiameterCommandCode_SIP_UA = 283,
    UMDiameterCommandCode_SIP_SA = 284,
    UMDiameterCommandCode_SIP_LI = 285,
    UMDiameterCommandCode_SIP_MA = 286,
    UMDiameterCommandCode_SIP_RT = 287,
    UMDiameterCommandCode_SIP_PP = 288,
    
    
    
    /* https://tools.ietf.org/html/rfc3589 TS 29.229*/

    UMDiameterCommandCode_3GPP_TS_29_272_UA = 300,
    UMDiameterCommandCode_3GPP_TS_29_272_SA = 301,
    UMDiameterCommandCode_3GPP_TS_29_272_LI = 302,
    UMDiameterCommandCode_3GPP_TS_29_272_MA = 303,
    UMDiameterCommandCode_3GPP_TS_29_272_RT = 304,
    UMDiameterCommandCode_3GPP_TS_29_272_PP = 305,
    UMDiameterCommandCode_3GPP_TS_29_272_UD = 306,
    UMDiameterCommandCode_3GPP_TS_29_272_PU= 307,
    UMDiameterCommandCode_3GPP_TS_29_272_SN = 308,
    UMDiameterCommandCode_3GPP_TS_29_272_PN = 309,
    UMDiameterCommandCode_3GPP_TS_29_272_BI = 310,
    UMDiameterCommandCode_3GPP_TS_29_272_MP = 311,
    
    /* https://tools.ietf.org/html/rfc5516 TS 29.272 */
    UMDiameterCommandCode_3GPP_Update_Location = 316, /* ULR ULA */
    UMDiameterCommandCode_3GPP_Cancel_Location = 317, /* CLR CLA*/
    UMDiameterCommandCode_3GPP_Authentication_Information = 318, /* AIR AIA */
    UMDiameterCommandCode_3GPP_Insert_Subscriber_Data = 319, /* IDR IDA */
    UMDiameterCommandCode_3GPP_Delete_Subscriber_Data = 320, /* DSR DSA */
    UMDiameterCommandCode_3GPP_Purge_UE = 321, /* PUR PUA */
    UMDiameterCommandCode_3GPP_Reset = 322, /* RSR RSA */
    UMDiameterCommandCode_3GPP_Notify = 323, /* NOR NOA */
    UMDiameterCommandCode_3GPP_ME_Identity_Check = 324, /* ECR ECA */

    UMDiameterCommandCode_3GPP_LCS_PL = 8388620,
    UMDiameterCommandCode_3GPP_LCS_RI = 8388622,
    UMDiameterCommandCode_AM = 260,
    UMDiameterCommandCode_HA = 262,
    UMDiameterCommandCode_3GPP_TS_29_336_CI = 8388718,
    UMDiameterCommandCode_3GPP_TS_29_336_RI = 8388719,
    UMDiameterCommandCode_3GPP_TS_29_336_NI = 8388726,


    UMDiameterCommandCode_Abort_Session = 274,
    UMDiameterCommandCode_Accounting = 271,
    UMDiameterCommandCode_Capabilities_Exchange = 257,
    UMDiameterCommandCode_Device_Watchdog = 280,
    UMDiameterCommandCode_Disconnect_Peer = 282,
    UMDiameterCommandCode_Re_Auth = 258,
    UMDiameterCommandCode_Session_Termination = 275,

} UMDiameterCommandCode;

extern NSString *UMDiameterCommandCode_description(UMDiameterCommandCode code, BOOL request);
