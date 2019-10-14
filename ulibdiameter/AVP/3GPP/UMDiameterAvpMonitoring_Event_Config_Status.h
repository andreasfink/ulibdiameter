//
//  UMDiameterAvpMonitoring_Event_Config_Status.h
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpService_Report;
@class UMDiameterAvpSCEF_Reference_ID;
@class UMDiameterAvpSCEF_ID;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMonitoring_Event_Config_Status : UMDiameterAvpGrouped
{
	UMDiameterAvpService_Report	*_var_service_report;
	UMDiameterAvpSCEF_Reference_ID	*_var_scef_reference_id;
	UMDiameterAvpSCEF_ID	*_var_scef_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpService_Report	*var_service_report;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_Reference_ID	*var_scef_reference_id;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*var_scef_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

