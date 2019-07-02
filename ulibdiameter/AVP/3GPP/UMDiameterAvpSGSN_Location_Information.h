//
//  UMDiameterAvpSGSN_Location_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpCell_Global_Identity;
@class UMDiameterAvpLocation_Area_Identity;
@class UMDiameterAvpService_Area_Identity;
@class UMDiameterAvpRouting_Area_Identity;
@class UMDiameterAvpGeographical_Information;
@class UMDiameterAvpGeodetic_Information;
@class UMDiameterAvpCurrent_Location_Retrieved;
@class UMDiameterAvpAge_Of_Location_Information;
@class UMDiameterAvpUser_CSG_Information;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSGSN_Location_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpCell_Global_Identity	*_var_cell_global_identity;
	UMDiameterAvpLocation_Area_Identity	*_var_location_area_identity;
	UMDiameterAvpService_Area_Identity	*_var_service_area_identity;
	UMDiameterAvpRouting_Area_Identity	*_var_routing_area_identity;
	UMDiameterAvpGeographical_Information	*_var_geographical_information;
	UMDiameterAvpGeodetic_Information	*_var_geodetic_information;
	UMDiameterAvpCurrent_Location_Retrieved	*_var_current_location_retrieved;
	UMDiameterAvpAge_Of_Location_Information	*_var_age_of_location_information;
	UMDiameterAvpUser_CSG_Information	*_var_user_csg_information;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpCell_Global_Identity	*var_cell_global_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpLocation_Area_Identity	*var_location_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Area_Identity	*var_service_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpRouting_Area_Identity	*var_routing_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpGeographical_Information	*var_geographical_information;
@property(readwrite,strong,atomic)	UMDiameterAvpGeodetic_Information	*var_geodetic_information;
@property(readwrite,strong,atomic)	UMDiameterAvpCurrent_Location_Retrieved	*var_current_location_retrieved;
@property(readwrite,strong,atomic)	UMDiameterAvpAge_Of_Location_Information	*var_age_of_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_CSG_Information	*var_user_csg_information;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

