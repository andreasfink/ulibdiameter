//
//  UMDiameterAvpMO_LR.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSS_Code;
@class UMDiameterAvpSS_Status;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMO_LR : UMDiameterAvpGrouped
{
	UMDiameterAvpSS_Code	*_ss_code;
	UMDiameterAvpSS_Status	*_ss_status;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSS_Code	*ss_code;
@property(readwrite,strong,atomic)	UMDiameterAvpSS_Status	*ss_status;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

