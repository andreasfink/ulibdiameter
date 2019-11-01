//
//  UMDiameterAvpUE_Reachability_Configuration.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpReachability_Type;
@class UMDiameterAvpMaximum_Response_Time;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpUE_Reachability_Configuration : UMDiameterAvpGrouped
{
	UMDiameterAvpReachability_Type	*_var_reachability_type;
	UMDiameterAvpMaximum_Response_Time	*_var_maximum_response_time;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpReachability_Type	*var_reachability_type;
@property(readwrite,strong,atomic)	UMDiameterAvpMaximum_Response_Time	*var_maximum_response_time;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

