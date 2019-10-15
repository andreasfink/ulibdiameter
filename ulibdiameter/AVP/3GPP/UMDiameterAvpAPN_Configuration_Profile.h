//
//  UMDiameterAvpAPN_Configuration_Profile.h
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpContext_Identifier;
@class UMDiameterAvpAdditional_Context_Identifier;
@class UMDiameterAvpAll_APN_Configurations_Included_Indicator;
@class UMDiameterAvpAPN_Configuration;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAPN_Configuration_Profile : UMDiameterAvpGrouped
{
	UMDiameterAvpContext_Identifier	*_var_context_identifier;
	UMDiameterAvpAdditional_Context_Identifier	*_var_additional_context_identifier;
	UMDiameterAvpAll_APN_Configurations_Included_Indicator	*_var_all_apn_configurations_included_indicator;
	NSArray<UMDiameterAvpAPN_Configuration *>	*_var_apn_configuration;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*var_context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpAdditional_Context_Identifier	*var_additional_context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpAll_APN_Configurations_Included_Indicator	*var_all_apn_configurations_included_indicator;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAPN_Configuration *>	*var_apn_configuration;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

