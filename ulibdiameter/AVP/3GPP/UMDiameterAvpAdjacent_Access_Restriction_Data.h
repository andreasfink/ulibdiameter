//
//  UMDiameterAvpAdjacent_Access_Restriction_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpVisited_PLMN_Id;
@class UMDiameterAvpAccess_Restriction_Data;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAdjacent_Access_Restriction_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpVisited_PLMN_Id	*_var_visited_plmn_id;
	UMDiameterAvpAccess_Restriction_Data	*_var_access_restriction_data;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpVisited_PLMN_Id	*var_visited_plmn_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAccess_Restriction_Data	*var_access_restriction_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

