//
//  UMDiameterAvpAuthentication_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpE_UTRAN_Vector;
@class UMDiameterAvpUTRAN_Vector;
@class UMDiameterAvpGERAN_Vector;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAuthentication_Info : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpE_UTRAN_Vector *>	*_e_utran_vector;
	NSArray<UMDiameterAvpUTRAN_Vector *>	*_utran_vector;
	NSArray<UMDiameterAvpGERAN_Vector *>	*_geran_vector;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpE_UTRAN_Vector *>	*e_utran_vector;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpUTRAN_Vector *>	*utran_vector;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpGERAN_Vector *>	*geran_vector;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

