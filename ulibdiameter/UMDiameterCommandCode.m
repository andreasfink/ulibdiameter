//
//  UMDiameterCommandCode.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//
#import <ulib/ulib.h>
#import "UMDiameterCommandCode.h"

NSString *UMDiameterCommandCode_description(UMDiameterCommandCode code, BOOL request)
{
    NSString *s = @"__";
    switch(code)
    {
        case UMDiameterCommandCode_Abort_Session:
            s = @"AS";
            break;

        case UMDiameterCommandCode_Accounting:
            s = @"AC";
            break;

        case UMDiameterCommandCode_Capabilities_Exchange:
            s = @"CE";
            break;
        case UMDiameterCommandCode_Device_Watchdog:
            s = @"DW";
            break;
        case UMDiameterCommandCode_Disconnect_Peer:
            s = @"DP";
            break;
        case UMDiameterCommandCode_Re_Auth:
            s = @"RA";
            break;
        case UMDiameterCommandCode_Session_Termination:
            s = @"ST";
            break;

        case UMDiameterCommandCode_AA:
            s = @"AA";
            break;
        case UMDiameterCommandCode_DE:
            s = @"DE";
            break;
        case UMDiameterCommandCode_CC:
            s = @"CC";

        case UMDiameterCommandCode_SIP_UA:
            s = @"SIP-UA";
            break;

        case UMDiameterCommandCode_SIP_SA:
            s = @"SIP-SA";
            break;

        case UMDiameterCommandCode_SIP_LI:
            s = @"SIP-LI";
            break;

        case UMDiameterCommandCode_SIP_MA:
            s = @"SIP-MA";
            break;

        case UMDiameterCommandCode_SIP_RT:
            s = @"SIP-RT";
            break;

        case UMDiameterCommandCode_SIP_PP:
            s = @"SIP-PP";
            break;

        case UMDiameterCommandCode_3GPP_TS_29_272_UA:
            s = @"TS_29_272-UA";
            break;

        case UMDiameterCommandCode_3GPP_TS_29_272_SA:
            s = @"TS_29_272-SA";
            break;

        case UMDiameterCommandCode_3GPP_TS_29_272_LI:
            s = @"TS_29_272-SA";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_MA:
            s = @"TS_29_272-MA";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_RT:
            s = @"TS_29_272-RT";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_PP:
            s = @"TS_29_272-PP";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_UD:
            s = @"TS_29_272-UD";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_PU:
            s = @"TS_29_272-PU";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_SN:
            s = @"TS_29_272-SN";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_PN:
            s = @"TS_29_272-PN";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_BI:
            s = @"TS_29_272-BI";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_272_MP:
            s = @"TS_29_272-MP";
            break;


            /* https://tools.ietf.org/html/rfc5516 TS 29.272 */
        case UMDiameterCommandCode_3GPP_Update_Location:
            s = @"3GPP-UL";
            break;

        case UMDiameterCommandCode_3GPP_Cancel_Location:
            s = @"3GPP-CL";
            break;

        case UMDiameterCommandCode_3GPP_Authentication_Information:
            s = @"3GPP-AI";
            break;

        case UMDiameterCommandCode_3GPP_Insert_Subscriber_Data:
            s = @"3GPP-ID";
            break;

        case UMDiameterCommandCode_3GPP_Delete_Subscriber_Data:
            s = @"3GPP-DS";
            break;

        case UMDiameterCommandCode_3GPP_Purge_UE:
            s = @"3GPP-PU";
            break;

        case UMDiameterCommandCode_3GPP_Reset:
            s = @"3GPP-RS";
            break;

        case UMDiameterCommandCode_3GPP_Notify:
            s = @"3GPP-NO";
            break;

        case UMDiameterCommandCode_3GPP_ME_Identity_Check:
            s = @"3GPP-EC";
            break;


        case UMDiameterCommandCode_3GPP_LCS_PL:
            s = @"3GPP-LCS-PL";
            break;

        case UMDiameterCommandCode_3GPP_LCS_RI:
            s = @"3GPP-LCS-RI";
            break;

        case UMDiameterCommandCode_AM:
            s = @"AM";
            break;

        case UMDiameterCommandCode_HA:
            s = @"HA";
            break;

        case UMDiameterCommandCode_3GPP_TS_29_336_CI:
            s = @"3GPP_TS_29_336-CI";
            break;

        case UMDiameterCommandCode_3GPP_TS_29_336_RI:
            s = @"3GPP_TS_29_336-RI";
            break;

        case UMDiameterCommandCode_3GPP_TS_29_336_NI:
            s = @"3GPP_TS_29_336-NI";
            break;

        case UMDiameterCommandCode_3GPP_TS_29_338_SR:
            s = @"3GPP_TS_29_338-SR";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_338_AL:
            s = @"3GPP_TS_29_338-AL";
            break;
        case UMDiameterCommandCode_3GPP_TS_29_338_RD:
            s = @"3GPP_TS_29_338-RD";
            break;
        case UMDiameterCommandCode_3GPP_Location_Request:
            s = @"3GPP Location Request";
            break;

    }
    if(request)
    {
        s = [NSString stringWithFormat:@"%@R",s];
    }
    else
    {
        s = [NSString stringWithFormat:@"%@R",s];
    }
    return s;
}
