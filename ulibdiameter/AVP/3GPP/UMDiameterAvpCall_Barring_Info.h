//
//  UMDiameterAvpCall_Barring_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:54:50.543000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSS_Code;
@class UMDiameterAvpSS_Status;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpCall_Barring_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpSS_Code	*_var_ss_code;
	UMDiameterAvpSS_Status	*_var_ss_status;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSS_Code	*var_ss_code;
@property(readwrite,strong,atomic)	UMDiameterAvpSS_Status	*var_ss_status;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

