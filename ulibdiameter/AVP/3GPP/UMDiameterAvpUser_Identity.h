//
//  UMDiameterAvpUser_Identity.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpPublic_Identity;
@class UMDiameterAvpMSISDN;
@class UMDiameterAvpExternal_Identifier;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpUser_Identity : UMDiameterAvpGrouped
{
	UMDiameterAvpPublic_Identity	*_var_public_identity;
	UMDiameterAvpMSISDN	*_var_msisdn;
	UMDiameterAvpExternal_Identifier	*_var_external_identifier;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpPublic_Identity	*var_public_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpMSISDN	*var_msisdn;
@property(readwrite,strong,atomic)	UMDiameterAvpExternal_Identifier	*var_external_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

