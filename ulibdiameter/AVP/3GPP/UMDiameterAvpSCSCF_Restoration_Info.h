//
//  UMDiameterAvpSCSCF_Restoration_Info.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpUser_Name;
@class UMDiameterAvpRestoration_Info;
@class UMDiameterAvpSIP_Authentication_Scheme;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSCSCF_Restoration_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpUser_Name	*_var_user_name;
	NSArray<UMDiameterAvpRestoration_Info *>	*_var_restoration_info;
	UMDiameterAvpSIP_Authentication_Scheme	*_var_sip_authentication_scheme;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRestoration_Info *>	*var_restoration_info;
@property(readwrite,strong,atomic)	UMDiameterAvpSIP_Authentication_Scheme	*var_sip_authentication_scheme;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

