//
//  UMDiameterAvpMonitoring_Event_Configuration.h
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSCEF_Reference_ID;
@class UMDiameterAvpSCEF_ID;
@class UMDiameterAvpMonitoring_Type;
@class UMDiameterAvpSCEF_Reference_ID_for_Deletion;
@class UMDiameterAvpMaximum_Number_of_Reports;
@class UMDiameterAvpMonitoring_Duration;
@class UMDiameterAvpCharged_Party;
@class UMDiameterAvpUE_Reachability_Configuration;
@class UMDiameterAvpLocation_Information_Configuration;
@class UMDiameterAvpSCEF_Realm;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMonitoring_Event_Configuration : UMDiameterAvpGrouped
{
	UMDiameterAvpSCEF_Reference_ID	*_var_scef_reference_id;
	UMDiameterAvpSCEF_ID	*_var_scef_id;
	UMDiameterAvpMonitoring_Type	*_var_monitoring_type;
	NSArray<UMDiameterAvpSCEF_Reference_ID_for_Deletion *>	*_var_scef_reference_id_for_deletion;
	UMDiameterAvpMaximum_Number_of_Reports	*_var_maximum_number_of_reports;
	UMDiameterAvpMonitoring_Duration	*_var_monitoring_duration;
	UMDiameterAvpCharged_Party	*_var_charged_party;
	UMDiameterAvpUE_Reachability_Configuration	*_var_ue_reachability_configuration;
	UMDiameterAvpLocation_Information_Configuration	*_var_location_information_configuration;
	UMDiameterAvpSCEF_Realm	*_var_scef_realm;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_Reference_ID	*var_scef_reference_id;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*var_scef_id;
@property(readwrite,strong,atomic)	UMDiameterAvpMonitoring_Type	*var_monitoring_type;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSCEF_Reference_ID_for_Deletion *>	*var_scef_reference_id_for_deletion;
@property(readwrite,strong,atomic)	UMDiameterAvpMaximum_Number_of_Reports	*var_maximum_number_of_reports;
@property(readwrite,strong,atomic)	UMDiameterAvpMonitoring_Duration	*var_monitoring_duration;
@property(readwrite,strong,atomic)	UMDiameterAvpCharged_Party	*var_charged_party;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_Reachability_Configuration	*var_ue_reachability_configuration;
@property(readwrite,strong,atomic)	UMDiameterAvpLocation_Information_Configuration	*var_location_information_configuration;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_Realm	*var_scef_realm;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

