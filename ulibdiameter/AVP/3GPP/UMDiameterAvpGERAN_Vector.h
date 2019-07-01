//
//  UMDiameterAvpGERAN_Vector.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
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
	UMDiameterAvpItem_Number	*_item_number;
	UMDiameterAvpRAND	*_rand;
	UMDiameterAvpSRES	*_sres;
	UMDiameterAvpKc	*_kc;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpItem_Number	*item_number;
@property(readwrite,strong,atomic)	UMDiameterAvpRAND	*rand;
@property(readwrite,strong,atomic)	UMDiameterAvpSRES	*sres;
@property(readwrite,strong,atomic)	UMDiameterAvpKc	*kc;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

