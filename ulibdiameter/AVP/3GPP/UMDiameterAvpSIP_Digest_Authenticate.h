//
//  UMDiameterAvpSIP_Digest_Authenticate.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpDigest_Realm;
@class UMDiameterAvpDigest_Algorithm;
@class UMDiameterAvpDigest_QoP;
@class UMDiameterAvpDigest_HA1;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSIP_Digest_Authenticate : UMDiameterAvpGrouped
{
	UMDiameterAvpDigest_Realm	*_var_digest_realm;
	UMDiameterAvpDigest_Algorithm	*_var_digest_algorithm;
	UMDiameterAvpDigest_QoP	*_var_digest_qop;
	UMDiameterAvpDigest_HA1	*_var_digest_ha1;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpDigest_Realm	*var_digest_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDigest_Algorithm	*var_digest_algorithm;
@property(readwrite,strong,atomic)	UMDiameterAvpDigest_QoP	*var_digest_qop;
@property(readwrite,strong,atomic)	UMDiameterAvpDigest_HA1	*var_digest_ha1;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

