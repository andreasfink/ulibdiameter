//
//  UMDiameterApplicationId.m
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterApplicationId.h"

NSString *umdiameter_application_id_string(uint32_t ai) 
{
    switch(ai)
    {
        case UMDiameterApplicationId_Diameter_Common_Messages:
            return @"Diameter_Common_Messages";
            break;

        case UMDiameterApplicationId_Diameter_Base_Accounting:
            return @"Diameter_Base_Accounting";
            break;

        case UMDiameterApplicationId_3GPP_Cx:
            return @"3GPP_Cx";
            break;

        case UMDiameterApplicationId_3GPP_Sh:
            return @"3GPP_Sh";
            break;

        case UMDiameterApplicationId_3GPP_Re:
            return @"3GPP_Re";
            break;

        case UMDiameterApplicationId_3GPP_Wx:
            return @"3GPP_Wx";
            break;

        case UMDiameterApplicationId_3GPP_Zn:
            return @"3GPP_Zn";
            break;

        case UMDiameterApplicationId_3GPP_Zh:
            return @"3GPP_Zh";
            break;

        case UMDiameterApplicationId_3GPP_Gq:
            return @"3GPP_Gq";
            break;

        case UMDiameterApplicationId_3GPP_Gmb:
            return @"3GPP_Gmb";
            break;

        case UMDiameterApplicationId_3GPP_Gx:
            return @"3GPP_Gx";
            break;

        case UMDiameterApplicationId_3GPP_Gx2:
            return @"3GPP_Gx2";
            break;

        case UMDiameterApplicationId_3GPP_Gx_over_Gy:
            return @"3GPP_Gx_over_Gy";
            break;

        case UMDiameterApplicationId_3GPP_MM10:
            return @"3GPP_MM10";
            break;

        case UMDiameterApplicationId_Ericsson_MSI:
            return @"Ericsson_MSI";
            break;

        case UMDiameterApplicationId_Ericsson_Zx:
            return @"Ericsson_Zx";
            break;

        case UMDiameterApplicationId_3GPP_Rx:
            return @"3GPP_Rx";
            break;

        case UMDiameterApplicationId_3GPP_Rx2:
            return @"3GPP_Rx2";
            break;

        case UMDiameterApplicationId_3GPP_Pr:
            return @"3GPP_Pr";
            break;

        case UMDiameterApplicationId_ETSI_e4:
            return @"ETSI_e4";
            break;

        case UMDiameterApplicationId_Ericsson_Charging_CIP:
            return @"Ericsson_Charging_CIP";
            break;

        case UMDiameterApplicationId_Ericsson_Mm:
            return @"Ericsson_Mm";
            break;

        case UMDiameterApplicationId_Vodafone_Gx_plus:
            return @"Vodafone_Gx_plus";
            break;

        case UMDiameterApplicationId_ITU_T_Rs:
            return @"ITU_T_Rs";
            break;

        case UMDiameterApplicationId_3GPP2_Ty:
            return @"3GPP2_Ty";
            break;

        case UMDiameterApplicationId_Juniper_Cluster:
            return @"Juniper_Cluster";
            break;

        case UMDiameterApplicationId_Juniper_Policy_Control_AAA:
            return @"Juniper_Policy_Control_AAA";
            break;

        case UMDiameterApplicationId_iptego_USPI:
            return @"iptego_USPI";
            break;

        case UMDiameterApplicationId_Covergence_specific_SIP_routing:
            return @"Covergence_specific_SIP_routing";
            break;

        case UMDiameterApplicationId_Policy_Processing:
            return @"Policy_Processing";
            break;

        case UMDiameterApplicationId_Juniper_Policy_Control_JSRC:
            return @"Juniper_Policy_Control_JSRC";
            break;

        case UMDiameterApplicationId_ITU_T_S_TC1:
            return @"ITU_T_S_TC1";
            break;

        case UMDiameterApplicationId_NSN_Unified_Charging_Trigger_Function:
            return @"NSN_Unified_Charging_Trigger_Function";
            break;

        case UMDiameterApplicationId_3GPP2_CAN_Access_Authentication_and_Authorization:
            return @"3GPP2_CAN_Access_Authentication_and_Authorization";
            break;

        case UMDiameterApplicationId_3GPP2_WLAN_Interworking_Access_Authentication_and_Authorization:
            return @"3GPP2_WLAN_Interworking_Access_Authentication_and_Authorization";
            break;

        case UMDiameterApplicationId_3GPP2_WLAN_Interworking_Accounting:
            return @"3GPP2_WLAN_Interworking_Accounting";
            break;

        case UMDiameterApplicationId_3GPP_Sta:
            return @"3GPP_Sta";
            break;

        case UMDiameterApplicationId_3GPP_S6a_S6d:
            return @"3GPP_S6a_S6d";
            break;

        case UMDiameterApplicationId_3GPP_S13:
            return @"3GPP_S13";
            break;

        case UMDiameterApplicationId_ETSI_Re:
            return @"ETSI_Re";
            break;

        case UMDiameterApplicationId_ETSI_GOCAP:
            return @"ETSI_GOCAP";
            break;

        case UMDiameterApplicationId_SLg:
            return @"SLg";
            break;

        case UMDiameterApplicationId_ITU_T_Rw:
            return @"ITU_T_Rw";
            break;

        case UMDiameterApplicationId_ETSI_a4:
            return @"ETSI_a4";
            break;

        case UMDiameterApplicationId_ITU_T_Rt:
            return @"ITU_T_Rt";
            break;

        case UMDiameterApplicationId_CARA:
            return @"CARA";
            break;

        case UMDiameterApplicationId_CAMA:
            return @"CAMA";
            break;

        case UMDiameterApplicationId_Femtocell_extension_EAP:
            return @"Femtocell_extension_EAP";
            break;

        case UMDiameterApplicationId_ITU_T_Ru:
            return @"ITU_T_Ru";
            break;

        case UMDiameterApplicationId_ITU_T_Ng:
            return @"ITU_T_Ng";
            break;

        case UMDiameterApplicationId_3GPP_SWm:
            return @"3GPP_SWm";
            break;

        case UMDiameterApplicationId_3GPP_SWx:
            return @"3GPP_SWx";
            break;

        case UMDiameterApplicationId_3GPP_Gxx:
            return @"3GPP_Gxx";
            break;

        case UMDiameterApplicationId_3GPP_S9:
            return @"3GPP_S9";
            break;

        case UMDiameterApplicationId_3GPP_Zpn:
            return @"3GPP_Zpn";
            break;

        case UMDiameterApplicationId_Ericsson_HSI:
            return @"Ericsson_HSI";
            break;

        case UMDiameterApplicationId_Juniper_Example:
            return @"Juniper_Example";
            break;

        case UMDiameterApplicationId_ITU_T_Ri:
            return @"ITU_T_Ri";
            break;

        case UMDiameterApplicationId_3GPP_S6b:
            return @"3GPP_S6b";
            break;

        case UMDiameterApplicationId_Juniper_JGx:
            return @"Juniper_JGx";
            break;

        case UMDiameterApplicationId_ITU_T_Rd:
            return @"ITU_T_Rd";
            break;

        case UMDiameterApplicationId_ADMI_Notification:
            return @"ADMI_Notification";
            break;

        case UMDiameterApplicationId_ADMI_Messaging_Interface:
            return @"ADMI_Messaging_Interface";
            break;

        case UMDiameterApplicationId_Peter_Service_VSI:
            return @"Peter_Service_VSI";
            break;

        case UMDiameterApplicationId_ETSI_Rr_request_model:
            return @"ETSI_Rr_request_model";
            break;

        case UMDiameterApplicationId_ETSI_Rr_delegated_model:
            return @"ETSI_Rr_delegated_model";
            break;

        case UMDiameterApplicationId_WIMAX_HRPD_Interworking:
            return @"WIMAX_HRPD_Interworking";
            break;

        case UMDiameterApplicationId_WiMAX_WNAAADA:
            return @"WiMAX_WNAAADA";
            break;

        case UMDiameterApplicationId_WiMAX_WNADA:
            return @"WiMAX_WNADA";
            break;

        case UMDiameterApplicationId_WiMAX_WM4DA:
            return @"WiMAX_WM4DA";
            break;

        case UMDiameterApplicationId_WiMAX_WM6DA:
            return @"WiMAX_WM6DA";
            break;

        case UMDiameterApplicationId_WiMAX_WDDA:
            return @"WiMAX_WDDA";
            break;

        case UMDiameterApplicationId_WiMAX_WLAADA:
            return @"WiMAX_WLAADA";
            break;

        case UMDiameterApplicationId_WiMAX_WiMAX_PCC_R3_P:
            return @"WiMAX_WiMAX_PCC_R3_P";
            break;

        case UMDiameterApplicationId_WiMAX_WiMAX_PCC_R3_OFC:
            return @"WiMAX_WiMAX_PCC_R3_OFC";
            break;

        case UMDiameterApplicationId_WiMAX_PCC_R3_OFC_PRIME:
            return @"WiMAX_PCC_R3_OFC_PRIME";
            break;

        case UMDiameterApplicationId_WiMAX_PCC_R3_OC:
            return @"WiMAX_PCC_R3_OC";
            break;

        case UMDiameterApplicationId_3GPP_SLh:
            return @"3GPP_SLh";
            break;

        case UMDiameterApplicationId_3GPP_SGmb:
            return @"3GPP_SGmb";
            break;

        case UMDiameterApplicationId_CMDI:
            return @"CMDI";
            break;

        case UMDiameterApplicationId_Camiant_DRMA:
            return @"Camiant_DRMA";
            break;

        case UMDiameterApplicationId_PiLTE_Interworking:
            return @"PiLTE_Interworking";
            break;

        case UMDiameterApplicationId_Juniper_Sessions_Recovery:
            return @"Juniper_Sessions_Recovery";
            break;

        case UMDiameterApplicationId_Vedicis_LiveProxy:
            return @"Vedicis_LiveProxy";
            break;

        case UMDiameterApplicationId_Pi_3GPP2_Diameter_Application:
            return @"Pi_3GPP2_Diameter_Application";
            break;

        case UMDiameterApplicationId_Sandvine_Rf_plus:
            return @"Sandvine_Rf_plus";
            break;

        case UMDiameterApplicationId_Subscription_Information:
            return @"Subscription_Information";
            break;

        case UMDiameterApplicationId_Ericsson_Charging_DCIP:
            return @"Ericsson_Charging_DCIP";
            break;

        case UMDiameterApplicationId_3GPP_Sy:
            return @"3GPP_Sy";
            break;

        case UMDiameterApplicationId_3GPP_Sd:
            return @"3GPP_Sd";
            break;

        case UMDiameterApplicationId_Ericsson_Sy:
            return @"Ericsson_Sy";
            break;

        case UMDiameterApplicationId_HP_DTD:
            return @"HP_DTD";
            break;

        case UMDiameterApplicationId_M9:
            return @"M9";
            break;

        case UMDiameterApplicationId_ITU_T_M13:
            return @"ITU_T_M13";
            break;

        case UMDiameterApplicationId_3GPP_S7a:
            return @"3GPP_S7a";
            break;

        case UMDiameterApplicationId_3GPP_Tsp:
            return @"3GPP_Tsp";
            break;

        case UMDiameterApplicationId_3GPP_S6m:
            return @"3GPP_S6m";
            break;

        case UMDiameterApplicationId_3GPP_T4:
            return @"3GPP_T4";
            break;

        case UMDiameterApplicationId_3GPP_S6c:
            return @"3GPP_S6c";
            break;

        case UMDiameterApplicationId_3GPP_SGd:
            return @"3GPP_SGd";
            break;

        case UMDiameterApplicationId_Intrado_SLg:
            return @"Intrado_SLg";
            break;

        case UMDiameterApplicationId_Ericsson_DSC:
            return @"Ericsson_DSC";
            break;

        case UMDiameterApplicationId_Verizon_Femto_Loc:
            return @"Verizon_Femto_Loc";
            break;

        case UMDiameterApplicationId_NSN_Hd:
            return @"NSN_Hd";
            break;

        case UMDiameterApplicationId_3GPP_S15:
            return @"3GPP_S15";
            break;

        case UMDiameterApplicationId_3GPP_S9a:
            return @"3GPP_S9a";
            break;

        case UMDiameterApplicationId_3GPP_S9a_2:
            return @"3GPP_S9a_2";
            break;

        case UMDiameterApplicationId_Gateway_Location_Application:
            return @"Gateway_Location_Application";
            break;

        case UMDiameterApplicationId_Verizon_Session_Recovery:
            return @"Verizon_Session_Recovery";
            break;

        case UMDiameterApplicationId_3GPP2_M1_Interface:
            return @"3GPP2_M1_Interface";
            break;

        case UMDiameterApplicationId_MAGIC_CIP:
            return @"MAGIC_CIP";
            break;

        case UMDiameterApplicationId_ITU_T_Nc:
            return @"ITU_T_Nc";
            break;

        case UMDiameterApplicationId_ITU_T_Ne:
            return @"ITU_T_Ne";
            break;

        case UMDiameterApplicationId_Ericsson_Sx:
            return @"Ericsson_Sx";
            break;

        case UMDiameterApplicationId_Nokia_Service_Extension:
            return @"Nokia_Service_Extension";
            break;

        case UMDiameterApplicationId_Rivada_Xd:
            return @"Rivada_Xd";
            break;

        case UMDiameterApplicationId_Rivada_Xm:
            return @"Rivada_Xm";
            break;

        case UMDiameterApplicationId_Rivada_Xh:
            return @"Rivada_Xh";
            break;

        case UMDiameterApplicationId_Rivada_Xf:
            return @"Rivada_Xf";
            break;

        case UMDiameterApplicationId_Rivada_Xp:
            return @"Rivada_Xp";
            break;

        case UMDiameterApplicationId_Rivada_Xa:
            return @"Rivada_Xa";
            break;

        case UMDiameterApplicationId_3GPP_MB2_C:
            return @"3GPP_MB2_C";
            break;

        case UMDiameterApplicationId_3GPP_PC4a:
            return @"3GPP_PC4a";
            break;

        case UMDiameterApplicationId_3GPP_PC2:
            return @"3GPP_PC2";
            break;

        case UMDiameterApplicationId_Juniper_Domain_Policy:
            return @"Juniper_Domain_Policy";
            break;

        case UMDiameterApplicationId_Host_Observer:
            return @"Host_Observer";
            break;

        case UMDiameterApplicationId_3GPP_PC6_PC7:
            return @"3GPP_PC6_PC7";
            break;

        case UMDiameterApplicationId_Nokia_Sdr_Application:
            return @"Nokia_Sdr_Application";
            break;

        case UMDiameterApplicationId_3GPP_Np:
            return @"3GPP_Np";
            break;

        case UMDiameterApplicationId_Sandvine_Location_Relay:
            return @"Sandvine_Location_Relay";
            break;

        case UMDiameterApplicationId_Sandvine_Fairshare:
            return @"Sandvine_Fairshare";
            break;

        case UMDiameterApplicationId_3GPP_S6t:
            return @"3GPP_S6t";
            break;

        case UMDiameterApplicationId_3GPP_T6a_T6b:
            return @"3GPP_T6a_T6b";
            break;

        case UMDiameterApplicationId_3GPP_Ns:
            return @"3GPP_Ns";
            break;

        case UMDiameterApplicationId_3GPP_Nt:
            return @"3GPP_Nt";
            break;

        case UMDiameterApplicationId_3GPP_St:
            return @"3GPP_St";
            break;

        case UMDiameterApplicationId_3GPP_PC2_2:
            return @"3GPP_PC2_2";
            break;

        case UMDiameterApplicationId_3GPP_Diameter_Data_Management:
            return @"3GPP_Diameter_Data_Management";
            break;

        case UMDiameterApplicationId_ITU_T_M1:
            return @"ITU_T_M1";
            break;

        case UMDiameterApplicationId_ITU_T_M2:
            return @"ITU_T_M2";
            break;

        case UMDiameterApplicationId_Verizon_NLS_WDS:
            return @"Verizon_NLS_WDS";
            break;

        case UMDiameterApplicationId_3GPP_V4:
            return @"3GPP_V4";
            break;

        case UMDiameterApplicationId_3GPP_V6:
            return @"3GPP_V6";
            break;

        case UMDiameterApplicationId_OMN_Adapt_Application:
            return @"OMN_Adapt_Application";
            break;

        case UMDiameterApplicationId_3GPP_Nta:
            return @"3GPP_Nta";
            break;

        case UMDiameterApplicationId_Ericsson_Charging_SBI_Policy:
            return @"Ericsson_Charging_SBI_Policy";
            break;
        default:
            return [NSString stringWithFormat:@"unknown(%u)",ai];
    }
}

