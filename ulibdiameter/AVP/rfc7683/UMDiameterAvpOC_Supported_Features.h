//
//  UMDiameterAvpOC_Supported_Features.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:16.191000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpOC_Feature_Vector;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpOC_Supported_Features : UMDiameterAvpGrouped
{
	UMDiameterAvpOC_Feature_Vector	*_var_oc_feature_vector;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpOC_Feature_Vector	*var_oc_feature_vector;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

