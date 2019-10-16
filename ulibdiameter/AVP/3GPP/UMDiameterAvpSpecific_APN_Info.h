//
//  UMDiameterAvpSpecific_APN_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpService_Selection;
@class UMDiameterAvpMIP6_Agent_Info;
@class UMDiameterAvpVisited_Network_Identifier;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSpecific_APN_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpService_Selection	*_var_service_selection;
	UMDiameterAvpMIP6_Agent_Info	*_var_mip6_agent_info;
	UMDiameterAvpVisited_Network_Identifier	*_var_visited_network_identifier;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*var_service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*var_mip6_agent_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_Network_Identifier	*var_visited_network_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

