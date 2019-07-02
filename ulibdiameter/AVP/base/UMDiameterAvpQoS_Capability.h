//
//  UMDiameterAvpQoS_Capability.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:32:28.185000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpQoS_Profile_Template;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpQoS_Capability : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpQoS_Profile_Template *>	*_var_qos_profile_template;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpQoS_Profile_Template *>	*var_qos_profile_template;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

