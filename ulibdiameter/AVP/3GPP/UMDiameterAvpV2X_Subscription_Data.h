//
//  UMDiameterAvpV2X_Subscription_Data.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpV2X_Permission;
@class UMDiameterAvpUE_PC5_AMBR;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpV2X_Subscription_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpV2X_Permission	*_var_v2x_permission;
	UMDiameterAvpUE_PC5_AMBR	*_var_ue_pc5_ambr;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpV2X_Permission	*var_v2x_permission;
@property(readwrite,strong,atomic)	UMDiameterAvpUE_PC5_AMBR	*var_ue_pc5_ambr;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

