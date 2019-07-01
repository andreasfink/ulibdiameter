//
//  UMDiameterAvpE_UTRAN_Vector.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpItem_Number;
@class UMDiameterAvpRAND;
@class UMDiameterAvpXRES;
@class UMDiameterAvpAUTN;
@class UMDiameterAvpKASME;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpE_UTRAN_Vector : UMDiameterAvpGrouped
{
	UMDiameterAvpItem_Number	*_item_number;
	UMDiameterAvpRAND	*_rand;
	UMDiameterAvpXRES	*_xres;
	UMDiameterAvpAUTN	*_autn;
	UMDiameterAvpKASME	*_kasme;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpItem_Number	*item_number;
@property(readwrite,strong,atomic)	UMDiameterAvpRAND	*rand;
@property(readwrite,strong,atomic)	UMDiameterAvpXRES	*xres;
@property(readwrite,strong,atomic)	UMDiameterAvpAUTN	*autn;
@property(readwrite,strong,atomic)	UMDiameterAvpKASME	*kasme;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

