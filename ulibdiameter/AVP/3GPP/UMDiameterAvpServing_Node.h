//
//  UMDiameterAvpServing_Node.h
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSGSN_Number;
@class UMDiameterAvpSGSN_Name;
@class UMDiameterAvpSGSN_Realm;
@class UMDiameterAvpMME_Name;
@class UMDiameterAvpMME_Realm;
@class UMDiameterAvpMSC_Number;
@class UMDiameterAvp3GPP_AAA_Server_Name;
@class UMDiameterAvpLCS_Capabilities_Sets;
@class UMDiameterAvpGMLC_Address;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpServing_Node : UMDiameterAvpGrouped
{
	UMDiameterAvpSGSN_Number	*_var_sgsn_number;
	UMDiameterAvpSGSN_Name	*_var_sgsn_name;
	UMDiameterAvpSGSN_Realm	*_var_sgsn_realm;
	UMDiameterAvpMME_Name	*_var_mme_name;
	UMDiameterAvpMME_Realm	*_var_mme_realm;
	UMDiameterAvpMSC_Number	*_var_msc_number;
	UMDiameterAvp3GPP_AAA_Server_Name	*_var_3gpp_aaa_server_name;
	UMDiameterAvpLCS_Capabilities_Sets	*_var_lcs_capabilities_sets;
	UMDiameterAvpGMLC_Address	*_var_gmlc_address;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_Number	*var_sgsn_number;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_Name	*var_sgsn_name;
@property(readwrite,strong,atomic)	UMDiameterAvpSGSN_Realm	*var_sgsn_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpMME_Name	*var_mme_name;
@property(readwrite,strong,atomic)	UMDiameterAvpMME_Realm	*var_mme_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpMSC_Number	*var_msc_number;
@property(readwrite,strong,atomic)	UMDiameterAvp3GPP_AAA_Server_Name	*var_3gpp_aaa_server_name;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Capabilities_Sets	*var_lcs_capabilities_sets;
@property(readwrite,strong,atomic)	UMDiameterAvpGMLC_Address	*var_gmlc_address;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

