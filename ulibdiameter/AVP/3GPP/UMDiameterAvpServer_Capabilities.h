//
//  UMDiameterAvpServer_Capabilities.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMandatory_Capability;
@class UMDiameterAvpOptional_Capability;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpServer_Capabilities : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpMandatory_Capability *>	*_var_mandatory_capability;
	NSArray<UMDiameterAvpOptional_Capability *>	*_var_optional_capability;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpMandatory_Capability *>	*var_mandatory_capability;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpOptional_Capability *>	*var_optional_capability;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

