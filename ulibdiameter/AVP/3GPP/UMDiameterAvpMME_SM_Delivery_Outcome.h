//
//  UMDiameterAvpMME_SM_Delivery_Outcome.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpSM_Delivery_Cause;
@class UMDiameterAvpAbsent_User_Diagnostic_SM;


@interface UMDiameterAvpMME_SM_Delivery_Outcome : UMDiameterAvpGrouped
{
	UMDiameterAvpSM_Delivery_Cause	*_var_sm_delivery_cause;
	UMDiameterAvpAbsent_User_Diagnostic_SM	*_var_absent_user_diagnostic_sm;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSM_Delivery_Cause	*var_sm_delivery_cause;
@property(readwrite,strong,atomic)	UMDiameterAvpAbsent_User_Diagnostic_SM	*var_absent_user_diagnostic_sm;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

