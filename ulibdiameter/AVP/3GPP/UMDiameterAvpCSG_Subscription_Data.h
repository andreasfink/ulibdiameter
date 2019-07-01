//
//  UMDiameterAvpCSG_Subscription_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpCSG_Id;
@class UMDiameterAvpExpiration_Date;
@class UMDiameterAvpService_Selection;
@class UMDiameterAvpVisited_PLMN_Id;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpCSG_Subscription_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpCSG_Id	*_csg_id;
	UMDiameterAvpExpiration_Date	*_expiration_date;
	NSArray<UMDiameterAvpService_Selection *>	*_service_selection;
	UMDiameterAvpVisited_PLMN_Id	*_visited_plmn_id;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpCSG_Id	*csg_id;
@property(readwrite,strong,atomic)	UMDiameterAvpExpiration_Date	*expiration_date;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpService_Selection *>	*service_selection;
@property(readwrite,strong,atomic)	UMDiameterAvpVisited_PLMN_Id	*visited_plmn_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

