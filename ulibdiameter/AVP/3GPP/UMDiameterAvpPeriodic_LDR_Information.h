//
//  UMDiameterAvpPeriodic_LDR_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpReporting_Amount;
@class UMDiameterAvpReporting_Interval;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpPeriodic_LDR_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpReporting_Amount	*_var_reporting_amount;
	UMDiameterAvpReporting_Interval	*_var_reporting_interval;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpReporting_Amount	*var_reporting_amount;
@property(readwrite,strong,atomic)	UMDiameterAvpReporting_Interval	*var_reporting_interval;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

