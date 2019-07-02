//
//  UMDiameterAvpLCS_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpGMLC_Number;
@class UMDiameterAvpLCS_PrivacyException;
@class UMDiameterAvpMO_LR;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpLCS_Info : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpGMLC_Number *>	*_var_gmlc_number;
	NSArray<UMDiameterAvpLCS_PrivacyException *>	*_var_lcs_privacyexception;
	NSArray<UMDiameterAvpMO_LR *>	*_var_mo_lr;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpGMLC_Number *>	*var_gmlc_number;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpLCS_PrivacyException *>	*var_lcs_privacyexception;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMO_LR *>	*var_mo_lr;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

