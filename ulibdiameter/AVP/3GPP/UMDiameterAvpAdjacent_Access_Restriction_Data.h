//
//  UMDiameterAvpAdjacent_Access_Restriction_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpVisited_PLMN_Id;
@class UMDiameterAvpAccess_Restriction_Data;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAdjacent_Access_Restriction_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpVisited_PLMN_Id	*_visited_plmn_id;
	UMDiameterAvpAccess_Restriction_Data	*_access_restriction_data;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpVisited_PLMN_Id	*visited_plmn_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAccess_Restriction_Data	*access_restriction_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

