//
//  UMDiameterAvpAllocation_Retention_Priority.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpPriority_Level;
@class UMDiameterAvpPre_emption_Capability;
@class UMDiameterAvpPre_emption_Vulnerability;


@interface UMDiameterAvpAllocation_Retention_Priority : UMDiameterAvpGrouped
{
	UMDiameterAvpPriority_Level	*_var_priority_level;
	UMDiameterAvpPre_emption_Capability	*_var_pre_emption_capability;
	UMDiameterAvpPre_emption_Vulnerability	*_var_pre_emption_vulnerability;
}

@property(readwrite,strong,atomic)	UMDiameterAvpPriority_Level	*var_priority_level;
@property(readwrite,strong,atomic)	UMDiameterAvpPre_emption_Capability	*var_pre_emption_capability;
@property(readwrite,strong,atomic)	UMDiameterAvpPre_emption_Vulnerability	*var_pre_emption_vulnerability;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

