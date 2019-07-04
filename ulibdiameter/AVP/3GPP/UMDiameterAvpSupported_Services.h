//
//  UMDiameterAvpSupported_Services.h
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
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

@end

