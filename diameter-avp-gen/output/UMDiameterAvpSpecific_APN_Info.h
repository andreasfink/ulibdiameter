//
//  UMDiameterAvpSpecific_APN_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpService_Selection;
@class UMDiameterAvpMIP6_Agent_Info;
@class UMDiameterAvpVisited_Network_Identifier;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSpecific_APN_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpService_Selection	*_service_selection;
	UMDiameterAvpMIP6_Agent_Info	*_mip6_agent_info;
	UMDiameterAvpVisited_Network_Identifier	*_visited_network_identifier;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpService_Selection	*service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*mip6_agent_info;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_Network_Identifier	*visited_network_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

