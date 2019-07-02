//
//  UMDiameterAvpAssociated_Registered_Identities.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpUser_Name;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAssociated_Registered_Identities : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpUser_Name *>	*_var_user_name;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpUser_Name *>	*var_user_name;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

