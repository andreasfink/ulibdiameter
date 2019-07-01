//
//  UMDiameterAvpActive_APN.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
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
	UMDiameterAvpContext_Identifier	*_context_identifier;
	UMDiameterAvpService_Selection	*_service_selection;
	UMDiameterAvpMIP6_Agent_Info	*_mip6_agent_info;
	UMDiameterAvpVisited_Network_Identifier	*_visited_network_identifier;
	NSArray<UMDiameterAvpSpecific_APN_Info *>	*_specific_apn_info;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*mip6_agent_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_Network_Identifier	*visited_network_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSpecific_APN_Info *>	*specific_apn_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

