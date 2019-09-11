//
//  UMDiameterAvpProSe_Subscription_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpProSe_Permission;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpProSe_Subscription_Data : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpProSe_Permission *>	*_var_prose_permission;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpProSe_Permission *>	*var_prose_permission;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

