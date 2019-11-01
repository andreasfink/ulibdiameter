//
//  UMDiameterAvpSupported_Features.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpVendor_Id;
@class UMDiameterAvpFeature_List_ID;
@class UMDiameterAvpFeature_List;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSupported_Features : UMDiameterAvpGrouped
{
	UMDiameterAvpVendor_Id	*_var_vendor_id;
	UMDiameterAvpFeature_List_ID	*_var_feature_list_id;
	UMDiameterAvpFeature_List	*_var_feature_list;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Id	*var_vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpFeature_List_ID	*var_feature_list_id;
@property(readwrite,strong,atomic)	UMDiameterAvpFeature_List	*var_feature_list;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

