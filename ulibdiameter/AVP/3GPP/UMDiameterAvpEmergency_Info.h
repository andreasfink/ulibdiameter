//
//  UMDiameterAvpEmergency_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMIP6_Agent_Info;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEmergency_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpMIP6_Agent_Info	*_mip6_agent_info;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMIP6_Agent_Info	*mip6_agent_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

