//
//  UMDiameterAvpMBSFN_Area.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMBSFN_Area_ID;
@class UMDiameterAvpCarrier_Frequency;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMBSFN_Area : UMDiameterAvpGrouped
{
	UMDiameterAvpMBSFN_Area_ID	*_var_mbsfn_area_id;
	UMDiameterAvpCarrier_Frequency	*_var_carrier_frequency;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMBSFN_Area_ID	*var_mbsfn_area_id;
@property(readwrite,strong,atomic)	UMDiameterAvpCarrier_Frequency	*var_carrier_frequency;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

