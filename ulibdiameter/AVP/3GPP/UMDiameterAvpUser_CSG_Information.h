//
//  UMDiameterAvpUser_CSG_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpCSG_ID;
@class UMDiameterAvpCSG_Access_Mode;
@class UMDiameterAvpCSG_Membership_Indication;


@interface UMDiameterAvpUser_CSG_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpCSG_ID	*_var_csg_id;
	UMDiameterAvpCSG_Access_Mode	*_var_csg_access_mode;
	UMDiameterAvpCSG_Membership_Indication	*_var_csg_membership_indication;
}

@property(readwrite,strong,atomic)	UMDiameterAvpCSG_ID	*var_csg_id;
@property(readwrite,strong,atomic)	UMDiameterAvpCSG_Access_Mode	*var_csg_access_mode;
@property(readwrite,strong,atomic)	UMDiameterAvpCSG_Membership_Indication	*var_csg_membership_indication;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

