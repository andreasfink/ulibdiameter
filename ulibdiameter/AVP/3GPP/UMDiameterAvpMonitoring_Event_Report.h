//
//  UMDiameterAvpMonitoring_Event_Report.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSCEF_Reference_ID;
@class UMDiameterAvpSCEF_ID;
@class UMDiameterAvpReachability_Information;
@class UMDiameterAvpEPS_Location_Information;
@class UMDiameterAvpMonitoring_Type;
@class UMDiameterAvpLoss_Of_Connectivity_Reason;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMonitoring_Event_Report : UMDiameterAvpGrouped
{
	UMDiameterAvpSCEF_Reference_ID	*_var_scef_reference_id;
	UMDiameterAvpSCEF_ID	*_var_scef_id;
	UMDiameterAvpReachability_Information	*_var_reachability_information;
	UMDiameterAvpEPS_Location_Information	*_var_eps_location_information;
	UMDiameterAvpMonitoring_Type	*_var_monitoring_type;
	UMDiameterAvpLoss_Of_Connectivity_Reason	*_var_loss_of_connectivity_reason;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_Reference_ID	*var_scef_reference_id;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*var_scef_id;
@property(readwrite,strong,atomic)	UMDiameterAvpReachability_Information	*var_reachability_information;
@property(readwrite,strong,atomic)	UMDiameterAvpEPS_Location_Information	*var_eps_location_information;
@property(readwrite,strong,atomic)	UMDiameterAvpMonitoring_Type	*var_monitoring_type;
@property(readwrite,strong,atomic)	UMDiameterAvpLoss_Of_Connectivity_Reason	*var_loss_of_connectivity_reason;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

