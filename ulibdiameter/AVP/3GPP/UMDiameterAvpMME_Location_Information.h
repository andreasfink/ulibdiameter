//
//  UMDiameterAvpMME_Location_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
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
	UMDiameterAvpE_UTRAN_Cell_Global_Identity	*_var_e_utran_cell_global_identity;
	UMDiameterAvpTracking_Area_Identity	*_var_tracking_area_identity;
	UMDiameterAvpGeographical_Information	*_var_geographical_information;
	UMDiameterAvpGeodetic_Information	*_var_geodetic_information;
	UMDiameterAvpCurrent_Location_Retrieved	*_var_current_location_retrieved;
	UMDiameterAvpAge_Of_Location_Information	*_var_age_of_location_information;
	UMDiameterAvpUser_CSG_Information	*_var_user_csg_information;
	UMDiameterAvpeNodeB_ID	*_var_enodeb_id;
	UMDiameterAvpExtended_eNodeB_ID	*_var_extended_enodeb_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpE_UTRAN_Cell_Global_Identity	*var_e_utran_cell_global_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpTracking_Area_Identity	*var_tracking_area_identity;
@property(readwrite,strong,atomic)	UMDiameterAvpGeographical_Information	*var_geographical_information;
@property(readwrite,strong,atomic)	UMDiameterAvpGeodetic_Information	*var_geodetic_information;
@property(readwrite,strong,atomic)	UMDiameterAvpCurrent_Location_Retrieved	*var_current_location_retrieved;
@property(readwrite,strong,atomic)	UMDiameterAvpAge_Of_Location_Information	*var_age_of_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpUser_CSG_Information	*var_user_csg_information;
@property(readwrite,strong,atomic)	UMDiameterAvpeNodeB_ID	*var_enodeb_id;
@property(readwrite,strong,atomic)	UMDiameterAvpExtended_eNodeB_ID	*var_extended_enodeb_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

