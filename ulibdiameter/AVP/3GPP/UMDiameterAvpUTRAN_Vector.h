//
//  UMDiameterAvpUTRAN_Vector.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpItem_Number;
@class UMDiameterAvpRAND;
@class UMDiameterAvpXRES;
@class UMDiameterAvpAUTN;
@class UMDiameterAvpConfidentiality_Key;
@class UMDiameterAvpIntegrity_Key;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpUTRAN_Vector : UMDiameterAvpGrouped
{
	UMDiameterAvpItem_Number	*_var_item_number;
	UMDiameterAvpRAND	*_var_rand;
	UMDiameterAvpXRES	*_var_xres;
	UMDiameterAvpAUTN	*_var_autn;
	UMDiameterAvpConfidentiality_Key	*_var_confidentiality_key;
	UMDiameterAvpIntegrity_Key	*_var_integrity_key;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpItem_Number	*var_item_number;
@property(readwrite,strong,atomic)	UMDiameterAvpRAND	*var_rand;
@property(readwrite,strong,atomic)	UMDiameterAvpXRES	*var_xres;
@property(readwrite,strong,atomic)	UMDiameterAvpAUTN	*var_autn;
@property(readwrite,strong,atomic)	UMDiameterAvpConfidentiality_Key	*var_confidentiality_key;
@property(readwrite,strong,atomic)	UMDiameterAvpIntegrity_Key	*var_integrity_key;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

