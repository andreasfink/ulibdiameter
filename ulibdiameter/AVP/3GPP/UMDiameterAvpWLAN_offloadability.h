//
//  UMDiameterAvpWLAN_offloadability.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpWLAN_offloadability_EUTRAN;
@class UMDiameterAvpWLAN_offloadability_UTRAN;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpWLAN_offloadability : UMDiameterAvpGrouped
{
	UMDiameterAvpWLAN_offloadability_EUTRAN	*_var_wlan_offloadability_eutran;
	UMDiameterAvpWLAN_offloadability_UTRAN	*_var_wlan_offloadability_utran;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpWLAN_offloadability_EUTRAN	*var_wlan_offloadability_eutran;
@property(readwrite,strong,atomic)	UMDiameterAvpWLAN_offloadability_UTRAN	*var_wlan_offloadability_utran;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

