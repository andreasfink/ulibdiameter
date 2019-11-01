//
//  UMDiameterAvpCSG_Subscription_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpCSG_ID;
@class UMDiameterAvpExpiration_Date;
@class UMDiameterAvpService_Selection;
@class UMDiameterAvpVisited_PLMN_Id;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpCSG_Subscription_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpCSG_ID	*_var_csg_id;
	UMDiameterAvpExpiration_Date	*_var_expiration_date;
	NSArray<UMDiameterAvpService_Selection *>	*_var_service_selection;
	UMDiameterAvpVisited_PLMN_Id	*_var_visited_plmn_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpCSG_ID	*var_csg_id;
@property(readwrite,strong,atomic)	UMDiameterAvpExpiration_Date	*var_expiration_date;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpService_Selection *>	*var_service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_PLMN_Id	*var_visited_plmn_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

