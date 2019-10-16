//
//  UMDiameterAvpArea_Definition.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpArea;
@class UMDiameterAvpAdditional_Area;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpArea_Definition : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpArea *>	*_var_area;
	NSArray<UMDiameterAvpAdditional_Area *>	*_var_additional_area;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpArea *>	*var_area;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAdditional_Area *>	*var_additional_area;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

