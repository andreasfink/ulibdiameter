//
//  UMDiameterAvpArea.h
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpArea_Type;
@class UMDiameterAvpArea_Identification;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpArea : UMDiameterAvpGrouped
{
	UMDiameterAvpArea_Type	*_var_area_type;
	UMDiameterAvpArea_Identification	*_var_area_identification;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpArea_Type	*var_area_type;
@property(readwrite,strong,atomic)	UMDiameterAvpArea_Identification	*var_area_identification;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

