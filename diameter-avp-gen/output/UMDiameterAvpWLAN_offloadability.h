//
//  UMDiameterAvpWLAN_offloadability.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpWLAN_offloadability_EUTRAN;
@class UMDiameterAvpWLAN_offloadability_UTRAN;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpWLAN_offloadability : UMDiameterAvpGrouped
{
	UMDiameterAvpWLAN_offloadability_EUTRAN	*_wlan_offloadability_eutran;
	UMDiameterAvpWLAN_offloadability_UTRAN	*_wlan_offloadability_utran;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpWLAN_offloadability_EUTRAN	*wlan_offloadability_eutran;
@property(readwrite,strong,atomic)	UMDiameterAvpWLAN_offloadability_UTRAN	*wlan_offloadability_utran;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

