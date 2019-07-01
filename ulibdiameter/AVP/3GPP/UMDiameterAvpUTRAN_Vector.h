//
//  UMDiameterAvpUTRAN_Vector.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
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
	UMDiameterAvpItem_Number	*_item_number;
	UMDiameterAvpRAND	*_rand;
	UMDiameterAvpXRES	*_xres;
	UMDiameterAvpAUTN	*_autn;
	UMDiameterAvpConfidentiality_Key	*_confidentiality_key;
	UMDiameterAvpIntegrity_Key	*_integrity_key;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpItem_Number	*item_number;
@property(readwrite,strong,atomic)	UMDiameterAvpRAND	*rand;
@property(readwrite,strong,atomic)	UMDiameterAvpXRES	*xres;
@property(readwrite,strong,atomic)	UMDiameterAvpAUTN	*autn;
@property(readwrite,strong,atomic)	UMDiameterAvpConfidentiality_Key	*confidentiality_key;
@property(readwrite,strong,atomic)	UMDiameterAvpIntegrity_Key	*integrity_key;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

