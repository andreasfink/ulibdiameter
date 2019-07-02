//
//  UMDiameterAvpMIP_MN_HA_MSA.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:00:34.245000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMIP_Session_Key;
@class UMDiameterAvpMIP_MSA_Lifetime;
@class UMDiameterAvpMIP_MN_HA_SPI;
@class UMDiameterAvpMIP_Algorithm_Type;
@class UMDiameterAvpMIP_Replay_Mode;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMIP_MN_HA_MSA : UMDiameterAvpGrouped
{
	UMDiameterAvpMIP_Session_Key	*_var_mip_session_key;
	UMDiameterAvpMIP_MSA_Lifetime	*_var_mip_msa_lifetime;
	UMDiameterAvpMIP_MN_HA_SPI	*_var_mip_mn_ha_spi;
	UMDiameterAvpMIP_Algorithm_Type	*_var_mip_algorithm_type;
	UMDiameterAvpMIP_Replay_Mode	*_var_mip_replay_mode;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMIP_Session_Key	*var_mip_session_key;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP_MSA_Lifetime	*var_mip_msa_lifetime;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP_MN_HA_SPI	*var_mip_mn_ha_spi;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP_Algorithm_Type	*var_mip_algorithm_type;
@property(readwrite,strong,atomic)	UMDiameterAvpMIP_Replay_Mode	*var_mip_replay_mode;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

