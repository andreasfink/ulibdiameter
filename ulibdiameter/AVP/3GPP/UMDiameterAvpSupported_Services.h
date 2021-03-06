//
//  UMDiameterAvpSupported_Services.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSupported_Monitoring_Events;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSupported_Services : UMDiameterAvpGrouped
{
	UMDiameterAvpSupported_Monitoring_Events	*_var_supported_monitoring_events;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSupported_Monitoring_Events	*var_supported_monitoring_events;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

