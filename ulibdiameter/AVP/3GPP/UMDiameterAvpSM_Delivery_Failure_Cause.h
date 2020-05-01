//
//  UMDiameterAvpSM_Delivery_Failure_Cause.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause;
@class UMDiameterAvpSM_Diagnostic_Info;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSM_Delivery_Failure_Cause : UMDiameterAvpGrouped
{
	UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause	*_var_sm_enumerated_delivery_failure_cause;
	UMDiameterAvpSM_Diagnostic_Info	*_var_sm_diagnostic_info;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause	*var_sm_enumerated_delivery_failure_cause;
@property(readwrite,strong,atomic)	UMDiameterAvpSM_Diagnostic_Info	*var_sm_diagnostic_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

