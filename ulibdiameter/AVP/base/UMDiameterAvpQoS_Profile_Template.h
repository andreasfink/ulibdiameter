//
//  UMDiameterAvpQoS_Profile_Template.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:20.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpVendor_Id;
@class UMDiameterAvpQoS_Profile_Id;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpQoS_Profile_Template : UMDiameterAvpGrouped
{
	UMDiameterAvpVendor_Id	*_var_vendor_id;
	UMDiameterAvpQoS_Profile_Id	*_var_qos_profile_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Id	*var_vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpQoS_Profile_Id	*var_qos_profile_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

