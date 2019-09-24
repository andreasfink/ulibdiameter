//
//  UMDiameterAvpAuthentication_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpE_UTRAN_Vector;
@class UMDiameterAvpUTRAN_Vector;
@class UMDiameterAvpGERAN_Vector;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAuthentication_Info : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpE_UTRAN_Vector *>	*_var_e_utran_vector;
	NSArray<UMDiameterAvpUTRAN_Vector *>	*_var_utran_vector;
	NSArray<UMDiameterAvpGERAN_Vector *>	*_var_geran_vector;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpE_UTRAN_Vector *>	*var_e_utran_vector;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpUTRAN_Vector *>	*var_utran_vector;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpGERAN_Vector *>	*var_geran_vector;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

