//
//  UMDiameterAvpMME_Location_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpE_UTRAN_Cell_Global_Identity;
@class UMDiameterAvpTracking_Area_Identity;
@class UMDiameterAvpGeographical_Information;
@class UMDiameterAvpGeodetic_Information;
@class UMDiameterAvpCurrent_Location_Retrieved;
@class UMDiameterAvpAge_Of_Location_Information;
@class UMDiameterAvpUser_CSG_Information;
@class UMDiameterAvpeNodeB_ID;
@class UMDiameterAvpExtended_eNodeB_ID;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMME_Location_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpE_UTRAN_Cell_Global_Identity	*_e_utran_cell_global_identity;
	UMDiameterAvpTracking_Area_Identity	*_tracking_area_identity;
	UMDiameterAvpGeographical_Information	*_geographical_information;
	UMDiameterAvpGeodetic_Information	*_geodetic_information;
	UMDiameterAvpCurrent_Location_Retrieved	*_current_location_retrieved;
	UMDiameterAvpAge_Of_Location_Information	*_age_of_location_information;
	UMDiameterAvpUser_CSG_Information	*_user_csg_information;
	UMDiameterAvpeNodeB_ID	*_enodeb_id;
	UMDiameterAvpExtended_eNodeB_ID	*_extended_enodeb_id;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpE_UTRAN_Cell_Global_Identity	*e_utran_cell_global_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpTracking_Area_Identity	*tracking_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpGeographical_Information	*geographical_information;
@property(readwrite,strong,atomic)	UMDiameterAvpGeodetic_Information	*geodetic_information;
@property(readwrite,strong,atomic)	UMDiameterAvpCurrent_Location_Retrieved	*current_location_retrieved;
@property(readwrite,strong,atomic)	UMDiameterAvpAge_Of_Location_Information	*age_of_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_CSG_Information	*user_csg_information;
@property(readwrite,strong,atomic)	UMDiameterAvpeNodeB_ID	*enodeb_id;
@property(readwrite,strong,atomic)	UMDiameterAvpExtended_eNodeB_ID	*extended_enodeb_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

