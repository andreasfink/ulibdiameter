//
//  UMDiameterAvpArea_Scope.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
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
	NSArray<UMDiameterAvpCell_Global_Identity *>	*_var_cell_global_identity;
	NSArray<UMDiameterAvpE_UTRAN_Cell_Global_Identity *>	*_var_e_utran_cell_global_identity;
	NSArray<UMDiameterAvpRouting_Area_Identity *>	*_var_routing_area_identity;
	NSArray<UMDiameterAvpLocation_Area_Identity *>	*_var_location_area_identity;
	NSArray<UMDiameterAvpTracking_Area_Identity *>	*_var_tracking_area_identity;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpCell_Global_Identity *>	*var_cell_global_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpE_UTRAN_Cell_Global_Identity *>	*var_e_utran_cell_global_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpRouting_Area_Identity *>	*var_routing_area_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpLocation_Area_Identity *>	*var_location_area_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpTracking_Area_Identity *>	*var_tracking_area_identity;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

