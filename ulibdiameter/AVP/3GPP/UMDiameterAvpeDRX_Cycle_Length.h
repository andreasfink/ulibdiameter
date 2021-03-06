//
//  UMDiameterAvpeDRX_Cycle_Length.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpRAT_Type;
@class UMDiameterAvpeDRX_Cycle_Length_Value;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpeDRX_Cycle_Length : UMDiameterAvpGrouped
{
	UMDiameterAvpRAT_Type	*_var_rat_type;
	UMDiameterAvpeDRX_Cycle_Length_Value	*_var_edrx_cycle_length_value;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpRAT_Type	*var_rat_type;
@property(readwrite,strong,atomic)	UMDiameterAvpeDRX_Cycle_Length_Value	*var_edrx_cycle_length_value;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

