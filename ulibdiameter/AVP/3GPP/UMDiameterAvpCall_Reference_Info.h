//
//  UMDiameterAvpCall_Reference_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpCall_Reference_Number;
@class UMDiameterAvpAS_Number;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpCall_Reference_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpCall_Reference_Number	*_var_call_reference_number;
	UMDiameterAvpAS_Number	*_var_as_number;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpCall_Reference_Number	*var_call_reference_number;
@property(readwrite,strong,atomic)	UMDiameterAvpAS_Number	*var_as_number;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

