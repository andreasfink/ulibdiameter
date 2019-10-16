//
//  UMDiameterAvpVPLMN_CSG_Subscription_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpCSG_ID;
@class UMDiameterAvpExpiration_Date;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpVPLMN_CSG_Subscription_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpCSG_ID	*_var_csg_id;
	UMDiameterAvpExpiration_Date	*_var_expiration_date;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpCSG_ID	*var_csg_id;
@property(readwrite,strong,atomic)	UMDiameterAvpExpiration_Date	*var_expiration_date;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

