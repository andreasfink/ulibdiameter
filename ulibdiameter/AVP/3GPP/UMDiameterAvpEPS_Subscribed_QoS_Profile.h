//
//  UMDiameterAvpEPS_Subscribed_QoS_Profile.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpQoS_Class_Identifier;
@class UMDiameterAvpAllocation_Retention_Priority;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEPS_Subscribed_QoS_Profile : UMDiameterAvpGrouped
{
	UMDiameterAvpQoS_Class_Identifier	*_var_qos_class_identifier;
	UMDiameterAvpAllocation_Retention_Priority	*_var_allocation_retention_priority;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpQoS_Class_Identifier	*var_qos_class_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpAllocation_Retention_Priority	*var_allocation_retention_priority;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

