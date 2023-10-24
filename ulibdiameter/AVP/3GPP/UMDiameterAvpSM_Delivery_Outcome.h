//
//  UMDiameterAvpSM_Delivery_Outcome.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMME_SM_Delivery_Outcome;
@class UMDiameterAvpMSC_SM_Delivery_Outcome;
@class UMDiameterAvpSGSN_SM_Delivery_Outcome;
@class UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSM_Delivery_Outcome : UMDiameterAvpGrouped
{
	UMDiameterAvpMME_SM_Delivery_Outcome	*_var_mme_sm_delivery_outcome;
	UMDiameterAvpMSC_SM_Delivery_Outcome	*_var_msc_sm_delivery_outcome;
	UMDiameterAvpSGSN_SM_Delivery_Outcome	*_var_sgsn_sm_delivery_outcome;
	UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome	*_var_ip_sm_gw_sm_delivery_outcome;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMME_SM_Delivery_Outcome	*var_mme_sm_delivery_outcome;
@property(readwrite,strong,atomic)	UMDiameterAvpMSC_SM_Delivery_Outcome	*var_msc_sm_delivery_outcome;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_SM_Delivery_Outcome	*var_sgsn_sm_delivery_outcome;
@property(readwrite,strong,atomic)	UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome	*var_ip_sm_gw_sm_delivery_outcome;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

