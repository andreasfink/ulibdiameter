//
//  UMDiameterAvpEPS_Subscribed_QoS_Profile.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpQoS_Class_Identifier;
@class UMDiameterAvpAllocation_Retention_Priority;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpEPS_Subscribed_QoS_Profile : UMDiameterAvpGrouped
{
	UMDiameterAvpQoS_Class_Identifier	*_qos_class_identifier;
	UMDiameterAvpAllocation_Retention_Priority	*_allocation_retention_priority;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpQoS_Class_Identifier	*qos_class_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpAllocation_Retention_Priority	*allocation_retention_priority;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

