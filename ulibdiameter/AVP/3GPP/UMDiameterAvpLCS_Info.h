//
//  UMDiameterAvpLCS_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpGMLC_Number;
@class UMDiameterAvpLCS_PrivacyException;
@class UMDiameterAvpMO_LR;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpLCS_Info : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpGMLC_Number *>	*_gmlc_number;
	NSArray<UMDiameterAvpLCS_PrivacyException *>	*_lcs_privacyexception;
	NSArray<UMDiameterAvpMO_LR *>	*_mo_lr;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpGMLC_Number *>	*gmlc_number;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpLCS_PrivacyException *>	*lcs_privacyexception;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMO_LR *>	*mo_lr;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

