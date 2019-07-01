//
//  UMDiameterAvpPDP_Context.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
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
	UMDiameterAvpContext_Identifier	*_context_identifier;
	UMDiameterAvpPDP_Type	*_pdp_type;
	UMDiameterAvpPDP_Address	*_pdp_address;
	UMDiameterAvpQoS_Subscribed	*_qos_subscribed;
	UMDiameterAvpVPLMN_Dynamic_Address_Allowed	*_vplmn_dynamic_address_allowed;
	UMDiameterAvpService_Selection	*_service_selection;
	UMDiameterAvp3GPP_Charging_Characteristics	*_3gpp_charging_characteristics;
	UMDiameterAvpExt_PDP_Type	*_ext_pdp_type;
	UMDiameterAvpExt_PDP_Address	*_ext_pdp_address;
	UMDiameterAvpAMBR	*_ambr;
	UMDiameterAvpAPN_OI_Replacement	*_apn_oi_replacement;
	UMDiameterAvpSIPTO_Permission	*_sipto_permission;
	UMDiameterAvpLIPA_Permission	*_lipa_permission;
	UMDiameterAvpRestoration_Priority	*_restoration_priority;
	UMDiameterAvpSIPTO_Local_Network_Permission	*_sipto_local_network_permission;
	UMDiameterAvpNon_IP_Data_Delivery_Mechanism	*_non_ip_data_delivery_mechanism;
	UMDiameterAvpSCEF_ID	*_scef_id;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpPDP_Type	*pdp_type;
@property(readwrite,strong,atomic)	UMDiameterAvpPDP_Address	*pdp_address;
@property(readwrite,strong,atomic)	UMDiameterAvpQoS_Subscribed	*qos_subscribed;
@property(readwrite,strong,atomic)	UMDiameterAvpVPLMN_Dynamic_Address_Allowed	*vplmn_dynamic_address_allowed;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvp3GPP_Charging_Characteristics	*3gpp_charging_characteristics;
@property(readwrite,strong,atomic)	UMDiameterAvpExt_PDP_Type	*ext_pdp_type;
@property(readwrite,strong,atomic)	UMDiameterAvpExt_PDP_Address	*ext_pdp_address;
@property(readwrite,strong,atomic)	UMDiameterAvpAMBR	*ambr;
@property(readwrite,strong,atomic)	UMDiameterAvpAPN_OI_Replacement	*apn_oi_replacement;
@property(readwrite,strong,atomic)	UMDiameterAvpSIPTO_Permission	*sipto_permission;
@property(readwrite,strong,atomic)	UMDiameterAvpLIPA_Permission	*lipa_permission;
@property(readwrite,strong,atomic)	UMDiameterAvpRestoration_Priority	*restoration_priority;
@property(readwrite,strong,atomic)	UMDiameterAvpSIPTO_Local_Network_Permission	*sipto_local_network_permission;
@property(readwrite,strong,atomic)	UMDiameterAvpNon_IP_Data_Delivery_Mechanism	*non_ip_data_delivery_mechanism;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*scef_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

