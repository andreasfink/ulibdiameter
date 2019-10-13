//
//  UMDiameterAvpE_UTRAN_Vector.h
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
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
	UMDiameterAvpItem_Number	*_var_item_number;
	UMDiameterAvpRAND	*_var_rand;
	UMDiameterAvpXRES	*_var_xres;
	UMDiameterAvpAUTN	*_var_autn;
	UMDiameterAvpKASME	*_var_kasme;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpItem_Number	*var_item_number;
@property(readwrite,strong,atomic)	UMDiameterAvpRAND	*var_rand;
@property(readwrite,strong,atomic)	UMDiameterAvpXRES	*var_xres;
@property(readwrite,strong,atomic)	UMDiameterAvpAUTN	*var_autn;
@property(readwrite,strong,atomic)	UMDiameterAvpKASME	*var_kasme;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

