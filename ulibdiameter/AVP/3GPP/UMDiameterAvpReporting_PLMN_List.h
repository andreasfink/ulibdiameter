//
//  UMDiameterAvpReporting_PLMN_List.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpPLMN_ID_List;
@class UMDiameterAvpPrioritized_List_Indicator;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpReporting_PLMN_List : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpPLMN_ID_List *>	*_var_plmn_id_list;
	UMDiameterAvpPrioritized_List_Indicator	*_var_prioritized_list_indicator;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpPLMN_ID_List *>	*var_plmn_id_list;
@property(readwrite,strong,atomic)	UMDiameterAvpPrioritized_List_Indicator	*var_prioritized_list_indicator;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

