//
//  UMDiameterAvpGERAN_Vector.h
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:53:14.933000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpItem_Number;
@class UMDiameterAvpRAND;
@class UMDiameterAvpSRES;
@class UMDiameterAvpKc;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpGERAN_Vector : UMDiameterAvpGrouped
{
	UMDiameterAvpItem_Number	*_var_item_number;
	UMDiameterAvpRAND	*_var_rand;
	UMDiameterAvpSRES	*_var_sres;
	UMDiameterAvpKc	*_var_kc;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpItem_Number	*var_item_number;
@property(readwrite,strong,atomic)	UMDiameterAvpRAND	*var_rand;
@property(readwrite,strong,atomic)	UMDiameterAvpSRES	*var_sres;
@property(readwrite,strong,atomic)	UMDiameterAvpKc	*var_kc;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

