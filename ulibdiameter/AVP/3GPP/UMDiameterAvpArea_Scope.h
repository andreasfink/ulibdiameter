//
//  UMDiameterAvpArea_Scope.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpCell_Global_Identity;
@class UMDiameterAvpE_UTRAN_Cell_Global_Identity;
@class UMDiameterAvpRouting_Area_Identity;
@class UMDiameterAvpLocation_Area_Identity;
@class UMDiameterAvpTracking_Area_Identity;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpArea_Scope : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpCell_Global_Identity *>	*_cell_global_identity;
	NSArray<UMDiameterAvpE_UTRAN_Cell_Global_Identity *>	*_e_utran_cell_global_identity;
	NSArray<UMDiameterAvpRouting_Area_Identity *>	*_routing_area_identity;
	NSArray<UMDiameterAvpLocation_Area_Identity *>	*_location_area_identity;
	NSArray<UMDiameterAvpTracking_Area_Identity *>	*_tracking_area_identity;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpCell_Global_Identity *>	*cell_global_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpE_UTRAN_Cell_Global_Identity *>	*e_utran_cell_global_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRouting_Area_Identity *>	*routing_area_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpLocation_Area_Identity *>	*location_area_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpTracking_Area_Identity *>	*tracking_area_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

