//
//  UMDiameterAvpAPN_Configuration.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpContext_Identifier;
@class UMDiameterAvpServed_Party_IP_Address;
@class UMDiameterAvpPDN_Type;
@class UMDiameterAvpService_Selection;
@class UMDiameterAvpEPS_Subscribed_QoS_Profile;
@class UMDiameterAvpVPLMN_Dynamic_Address_Allowed;
@class UMDiameterAvpMIP6_Agent_Info;
@class UMDiameterAvpVisited_Network_Identifier;


@interface UMDiameterAvpAPN_Configuration : UMDiameterAvpGrouped
{
	UMDiameterAvpContext_Identifier	*_var_context_identifier;
	NSArray<UMDiameterAvpServed_Party_IP_Address *>	*_var_served_party_ip_address;
	UMDiameterAvpPDN_Type	*_var_pdn_type;
	UMDiameterAvpService_Selection	*_var_service_selection;
	UMDiameterAvpEPS_Subscribed_QoS_Profile	*_var_eps_subscribed_qos_profile;
	UMDiameterAvpVPLMN_Dynamic_Address_Allowed	*_var_vplmn_dynamic_address_allowed;
	UMDiameterAvpMIP6_Agent_Info	*_var_mip6_agent_info;
	UMDiameterAvpVisited_Network_Identifier	*_var_visited_network_identifier;
}

@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*var_context_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpServed_Party_IP_Address *>	*var_served_party_ip_address;
@property(readwrite,strong,atomic)	UMDiameterAvpPDN_Type	*var_pdn_type;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*var_service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpEPS_Subscribed_QoS_Profile	*var_eps_subscribed_qos_profile;
@property(readwrite,strong,atomic)	UMDiameterAvpVPLMN_Dynamic_Address_Allowed	*var_vplmn_dynamic_address_allowed;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*var_mip6_agent_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_Network_Identifier	*var_visited_network_identifier;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

