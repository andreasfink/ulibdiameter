//
//  UMDiameterAvpLCS_QoS.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpLCS_QoS_Class;
@class UMDiameterAvpHorizontal_Accuracy;
@class UMDiameterAvpVertical_Accuracy;
@class UMDiameterAvpVertical_Requested;
@class UMDiameterAvpResponse_Time;


@interface UMDiameterAvpLCS_QoS : UMDiameterAvpGrouped
{
	UMDiameterAvpLCS_QoS_Class	*_var_lcs_qos_class;
	UMDiameterAvpHorizontal_Accuracy	*_var_horizontal_accuracy;
	UMDiameterAvpVertical_Accuracy	*_var_vertical_accuracy;
	UMDiameterAvpVertical_Requested	*_var_vertical_requested;
	UMDiameterAvpResponse_Time	*_var_response_time;
}

@property(readwrite,strong,atomic)	UMDiameterAvpLCS_QoS_Class	*var_lcs_qos_class;
@property(readwrite,strong,atomic)	UMDiameterAvpHorizontal_Accuracy	*var_horizontal_accuracy;
@property(readwrite,strong,atomic)	UMDiameterAvpVertical_Accuracy	*var_vertical_accuracy;
@property(readwrite,strong,atomic)	UMDiameterAvpVertical_Requested	*var_vertical_requested;
@property(readwrite,strong,atomic)	UMDiameterAvpResponse_Time	*var_response_time;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

