//
//  UMDiameterAvpGPRS_Subscription_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpComplete_Data_List_Included_Indicator;
@class UMDiameterAvpPDP_Context;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpGPRS_Subscription_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpComplete_Data_List_Included_Indicator	*_complete_data_list_included_indicator;
	NSArray<UMDiameterAvpPDP_Context *>	*_pdp_context;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpComplete_Data_List_Included_Indicator	*complete_data_list_included_indicator;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpPDP_Context *>	*pdp_context;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

