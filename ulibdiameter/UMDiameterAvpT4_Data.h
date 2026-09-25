//
//  UMDiameterAvpT4_Data.h
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:21:03.403903
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpHSS_Cause;
@class UMDiameterAvpServing_Node;
@class UMDiameterAvpAdditional_Serving_Node;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpT4_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpHSS_Cause	*_var_hss_cause;
	UMDiameterAvpServing_Node	*_var_serving_node;
	NSArray<UMDiameterAvpAdditional_Serving_Node *>	*_var_additional_serving_node;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpHSS_Cause	*var_hss_cause;
@property(readwrite,strong,atomic)	UMDiameterAvpServing_Node	*var_serving_node;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAdditional_Serving_Node *>	*var_additional_serving_node;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

