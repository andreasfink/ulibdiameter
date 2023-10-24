//
//  UMDiameterAvpQoS_Resources.h
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:36:20.640598
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpFilter_Rule;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpQoS_Resources : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpFilter_Rule *>	*_var_filter_rule;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpFilter_Rule *>	*var_filter_rule;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

