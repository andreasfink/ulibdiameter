//
//  UMDiameterAvpeDRX_Cycle_Length.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpRAT_Type;
@class UMDiameterAvpeDRX_Cycle_Length_Value;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpeDRX_Cycle_Length : UMDiameterAvpGrouped
{
	UMDiameterAvpRAT_Type	*_rat_type;
	UMDiameterAvpeDRX_Cycle_Length_Value	*_edrx_cycle_length_value;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpRAT_Type	*rat_type;
@property(readwrite,strong,atomic)	UMDiameterAvpeDRX_Cycle_Length_Value	*edrx_cycle_length_value;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

