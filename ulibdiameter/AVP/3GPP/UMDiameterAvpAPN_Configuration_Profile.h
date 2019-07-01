//
//  UMDiameterAvpAPN_Configuration_Profile.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
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
	UMDiameterAvpContext_Identifier	*_context_identifier;
	UMDiameterAvpAdditional_Context_Identifier	*_additional_context_identifier;
	UMDiameterAvpAll_APN_Configurations_Included_Indicator	*_all_apn_configurations_included_indicator;
	NSArray<UMDiameterAvpAPN_Configuration *>	*_apn_configuration;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpContext_Identifier	*context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpAdditional_Context_Identifier	*additional_context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpAll_APN_Configurations_Included_Indicator	*all_apn_configurations_included_indicator;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAPN_Configuration *>	*apn_configuration;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

