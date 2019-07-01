//
//  UMDiameterAvpMBSFN_Area.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMBSFN_Area_ID;
@class UMDiameterAvpCarrier_Frequency;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMBSFN_Area : UMDiameterAvpGrouped
{
	UMDiameterAvpMBSFN_Area_ID	*_mbsfn_area_id;
	UMDiameterAvpCarrier_Frequency	*_carrier_frequency;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMBSFN_Area_ID	*mbsfn_area_id;
@property(readwrite,strong,atomic)	UMDiameterAvpCarrier_Frequency	*carrier_frequency;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

