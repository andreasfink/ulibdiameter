//
//  UMDiameterAvpLocation_Information_Configuration.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMONTE_Location_Type;
@class UMDiameterAvpAccuracy;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpLocation_Information_Configuration : UMDiameterAvpGrouped
{
	UMDiameterAvpMONTE_Location_Type	*_var_monte_location_type;
	UMDiameterAvpAccuracy	*_var_accuracy;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMONTE_Location_Type	*var_monte_location_type;
@property(readwrite,strong,atomic)	UMDiameterAvpAccuracy	*var_accuracy;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

