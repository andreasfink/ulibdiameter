//
//  UMDiameterAvpEmergency_Info.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMIP6_Agent_Info;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEmergency_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpMIP6_Agent_Info	*_var_mip6_agent_info;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*var_mip6_agent_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

