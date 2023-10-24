//
//  UMDiameterAvpUser_Identifier.h
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:07:51.067649
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpUser_Name;
@class UMDiameterAvpMSISDN;
@class UMDiameterAvpExternal_Identifier;
@class UMDiameterAvpLMSI;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpUser_Identifier : UMDiameterAvpGrouped
{
	UMDiameterAvpUser_Name	*_var_user_name;
	UMDiameterAvpMSISDN	*_var_msisdn;
	UMDiameterAvpExternal_Identifier	*_var_external_identifier;
	UMDiameterAvpLMSI	*_var_lmsi;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpUser_Name	*var_user_name;
@property(readwrite,strong,atomic)	UMDiameterAvpMSISDN	*var_msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpExternal_Identifier	*var_external_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpLMSI	*var_lmsi;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

