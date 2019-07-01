//
//  UMDiameterAvpAPN_Configuration.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
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
	UMDiameterAvpContext_Identifier	*_context_identifier;
	NSArray<UMDiameterAvpServed_Party_IP_Address *>	*_served_party_ip_address;
	UMDiameterAvpPDN_Type	*_pdn_type;
	UMDiameterAvpService_Selection	*_service_selection;
	UMDiameterAvpEPS_Subscribed_QoS_Profile	*_eps_subscribed_qos_profile;
	UMDiameterAvpVPLMN_Dynamic_Address_Allowed	*_vplmn_dynamic_address_allowed;
	UMDiameterAvpMIP6_Agent_Info	*_mip6_agent_info;
	UMDiameterAvpVisited_Network_Identifier	*_visited_network_identifier;
}

@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*context_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpServed_Party_IP_Address *>	*served_party_ip_address;
@property(readwrite,strong,atomic)	UMDiameterAvpPDN_Type	*pdn_type;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpEPS_Subscribed_QoS_Profile	*eps_subscribed_qos_profile;
@property(readwrite,strong,atomic)	UMDiameterAvpVPLMN_Dynamic_Address_Allowed	*vplmn_dynamic_address_allowed;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*mip6_agent_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_Network_Identifier	*visited_network_identifier;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

