//
//  UMDiameterAvpIMSI_Group_Id.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpGroup_Service_Id;
@class UMDiameterAvpGroup_PLMN_Id;
@class UMDiameterAvpLocal_Group_Id;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpIMSI_Group_Id : UMDiameterAvpGrouped
{
	UMDiameterAvpGroup_Service_Id	*_var_group_service_id;
	UMDiameterAvpGroup_PLMN_Id	*_var_group_plmn_id;
	UMDiameterAvpLocal_Group_Id	*_var_local_group_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpGroup_Service_Id	*var_group_service_id;
@property(readwrite,strong,atomic)	UMDiameterAvpGroup_PLMN_Id	*var_group_plmn_id;
@property(readwrite,strong,atomic)	UMDiameterAvpLocal_Group_Id	*var_local_group_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

