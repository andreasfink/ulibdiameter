//
//  UMDiameterAvpSGSN_Location_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
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
	UMDiameterAvpCell_Global_Identity	*_cell_global_identity;
	UMDiameterAvpLocation_Area_Identity	*_location_area_identity;
	UMDiameterAvpService_Area_Identity	*_service_area_identity;
	UMDiameterAvpRouting_Area_Identity	*_routing_area_identity;
	UMDiameterAvpGeographical_Information	*_geographical_information;
	UMDiameterAvpGeodetic_Information	*_geodetic_information;
	UMDiameterAvpCurrent_Location_Retrieved	*_current_location_retrieved;
	UMDiameterAvpAge_Of_Location_Information	*_age_of_location_information;
	UMDiameterAvpUser_CSG_Information	*_user_csg_information;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpCell_Global_Identity	*cell_global_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpLocation_Area_Identity	*location_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Area_Identity	*service_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpRouting_Area_Identity	*routing_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpGeographical_Information	*geographical_information;
@property(readwrite,strong,atomic)	UMDiameterAvpGeodetic_Information	*geodetic_information;
@property(readwrite,strong,atomic)	UMDiameterAvpCurrent_Location_Retrieved	*current_location_retrieved;
@property(readwrite,strong,atomic)	UMDiameterAvpAge_Of_Location_Information	*age_of_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_CSG_Information	*user_csg_information;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

