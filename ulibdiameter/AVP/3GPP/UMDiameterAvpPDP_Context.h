//
//  UMDiameterAvpPDP_Context.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpContext_Identifier;
@class UMDiameterAvpPDP_Type;
@class UMDiameterAvpPDP_Address;
@class UMDiameterAvpQoS_Subscribed;
@class UMDiameterAvpVPLMN_Dynamic_Address_Allowed;
@class UMDiameterAvpService_Selection;
@class UMDiameterAvp3GPP_Charging_Characteristics;
@class UMDiameterAvpExt_PDP_Type;
@class UMDiameterAvpExt_PDP_Address;
@class UMDiameterAvpAMBR;
@class UMDiameterAvpAPN_OI_Replacement;
@class UMDiameterAvpSIPTO_Permission;
@class UMDiameterAvpLIPA_Permission;
@class UMDiameterAvpRestoration_Priority;
@class UMDiameterAvpSIPTO_Local_Network_Permission;
@class UMDiameterAvpNon_IP_Data_Delivery_Mechanism;
@class UMDiameterAvpSCEF_ID;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpPDP_Context : UMDiameterAvpGrouped
{
	UMDiameterAvpContext_Identifier	*_var_context_identifier;
	UMDiameterAvpPDP_Type	*_var_pdp_type;
	UMDiameterAvpPDP_Address	*_var_pdp_address;
	UMDiameterAvpQoS_Subscribed	*_var_qos_subscribed;
	UMDiameterAvpVPLMN_Dynamic_Address_Allowed	*_var_vplmn_dynamic_address_allowed;
	UMDiameterAvpService_Selection	*_var_service_selection;
	UMDiameterAvp3GPP_Charging_Characteristics	*_var_3gpp_charging_characteristics;
	UMDiameterAvpExt_PDP_Type	*_var_ext_pdp_type;
	UMDiameterAvpExt_PDP_Address	*_var_ext_pdp_address;
	UMDiameterAvpAMBR	*_var_ambr;
	UMDiameterAvpAPN_OI_Replacement	*_var_apn_oi_replacement;
	UMDiameterAvpSIPTO_Permission	*_var_sipto_permission;
	UMDiameterAvpLIPA_Permission	*_var_lipa_permission;
	UMDiameterAvpRestoration_Priority	*_var_restoration_priority;
	UMDiameterAvpSIPTO_Local_Network_Permission	*_var_sipto_local_network_permission;
	UMDiameterAvpNon_IP_Data_Delivery_Mechanism	*_var_non_ip_data_delivery_mechanism;
	UMDiameterAvpSCEF_ID	*_var_scef_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*var_context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpPDP_Type	*var_pdp_type;
@property(readwrite,strong,atomic)	UMDiameterAvpPDP_Address	*var_pdp_address;
@property(readwrite,strong,atomic)	UMDiameterAvpQoS_Subscribed	*var_qos_subscribed;
@property(readwrite,strong,atomic)	UMDiameterAvpVPLMN_Dynamic_Address_Allowed	*var_vplmn_dynamic_address_allowed;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*var_service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvp3GPP_Charging_Characteristics	*var_3gpp_charging_characteristics;
@property(readwrite,strong,atomic)	UMDiameterAvpExt_PDP_Type	*var_ext_pdp_type;
@property(readwrite,strong,atomic)	UMDiameterAvpExt_PDP_Address	*var_ext_pdp_address;
@property(readwrite,strong,atomic)	UMDiameterAvpAMBR	*var_ambr;
@property(readwrite,strong,atomic)	UMDiameterAvpAPN_OI_Replacement	*var_apn_oi_replacement;
@property(readwrite,strong,atomic)	UMDiameterAvpSIPTO_Permission	*var_sipto_permission;
@property(readwrite,strong,atomic)	UMDiameterAvpLIPA_Permission	*var_lipa_permission;
@property(readwrite,strong,atomic)	UMDiameterAvpRestoration_Priority	*var_restoration_priority;
@property(readwrite,strong,atomic)	UMDiameterAvpSIPTO_Local_Network_Permission	*var_sipto_local_network_permission;
@property(readwrite,strong,atomic)	UMDiameterAvpNon_IP_Data_Delivery_Mechanism	*var_non_ip_data_delivery_mechanism;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*var_scef_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

