//
//  UMDiameterAvpIMSI_Group_Id.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpGroup_Service_Id;
@class UMDiameterAvpGroup_PLMN_Id;
@class UMDiameterAvpLocal_Group_Id;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpIMSI_Group_Id : UMDiameterAvpGrouped
{
	UMDiameterAvpGroup_Service_Id	*_group_service_id;
	UMDiameterAvpGroup_PLMN_Id	*_group_plmn_id;
	UMDiameterAvpLocal_Group_Id	*_local_group_id;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpGroup_Service_Id	*group_service_id;
@property(readwrite,strong,atomic)	UMDiameterAvpGroup_PLMN_Id	*group_plmn_id;
@property(readwrite,strong,atomic)	UMDiameterAvpLocal_Group_Id	*local_group_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end
