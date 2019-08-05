//
//  UMDiameterAvpActive_APN.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpContext_Identifier;
@class UMDiameterAvpService_Selection;
@class UMDiameterAvpMIP6_Agent_Info;
@class UMDiameterAvpVisited_Network_Identifier;
@class UMDiameterAvpSpecific_APN_Info;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpActive_APN : UMDiameterAvpGrouped
{
	UMDiameterAvpContext_Identifier	*_var_context_identifier;
	UMDiameterAvpService_Selection	*_var_service_selection;
	UMDiameterAvpMIP6_Agent_Info	*_var_mip6_agent_info;
	UMDiameterAvpVisited_Network_Identifier	*_var_visited_network_identifier;
	NSArray<UMDiameterAvpSpecific_APN_Info *>	*_var_specific_apn_info;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*var_context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*var_service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*var_mip6_agent_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_Network_Identifier	*var_visited_network_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSpecific_APN_Info *>	*var_specific_apn_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

