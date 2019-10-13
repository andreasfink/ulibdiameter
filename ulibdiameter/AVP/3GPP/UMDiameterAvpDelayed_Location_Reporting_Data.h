//
//  UMDiameterAvpDelayed_Location_Reporting_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpTermination_Cause;
@class UMDiameterAvpServing_Node;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpDelayed_Location_Reporting_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpTermination_Cause	*_var_termination_cause;
	UMDiameterAvpServing_Node	*_var_serving_node;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpTermination_Cause	*var_termination_cause;
@property(readwrite,strong,atomic)	UMDiameterAvpServing_Node	*var_serving_node;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

