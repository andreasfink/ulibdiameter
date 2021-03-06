//
//  UMDiameterAvpDeferred_MT_LR_Data.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpDeferred_Location_Type;
@class UMDiameterAvpTermination_Cause;


@interface UMDiameterAvpDeferred_MT_LR_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpDeferred_Location_Type	*_var_deferred_location_type;
	UMDiameterAvpTermination_Cause	*_var_termination_cause;
}

@property(readwrite,strong,atomic)	UMDiameterAvpDeferred_Location_Type	*var_deferred_location_type;
@property(readwrite,strong,atomic)	UMDiameterAvpTermination_Cause	*var_termination_cause;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

