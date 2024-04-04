//
//  UMDiameterAvpMIP6_Agent_Info.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 09:27:58.260329
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpMIP_Home_Agent_Address;
@class UMDiameterAvpMIP_Home_Agent_Host;
@class UMDiameterAvpMIP6_Home_Link_Prefix;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMIP6_Agent_Info : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpMIP_Home_Agent_Address *>	*_var_mip_home_agent_address;
	UMDiameterAvpMIP_Home_Agent_Host	*_var_mip_home_agent_host;
	UMDiameterAvpMIP6_Home_Link_Prefix	*_var_mip6_home_link_prefix;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMIP_Home_Agent_Address *>	*var_mip_home_agent_address;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP_Home_Agent_Host	*var_mip_home_agent_host;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Home_Link_Prefix	*var_mip6_home_link_prefix;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

